#!/bin/bash

if [[ $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM already running"
  exit
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

vfio_gpu_device="0000:03:00.0"
vfio_gpu_audio="0000:03:00.1"
vm_disk="Virtual Disks/win10.qcow2"
uefi_code_path=".vfio/OVMF_CODE.fd"
uefi_vars_path=".vfio/OVMF_VARS.bin"
win_iso="Downloads/Win10_1709_English_x64.iso"
virtio_iso="Downloads/virtio-win-0.1.141.iso"

export QEMU_PA_SERVER="/run/user/$(id -u "$SUDO_USER")/pulse/native"
export QEMU_PA_SAMPLES=128
export QEMU_AUDIO_DRV=pa
cp .config/pulse/cookie /root/.config/pulse/cookie

precreationg=$(ip tuntap list | cut -d: -f1 | sort)
ip tuntap add user $SUDO_USER mode tap
postcreation=$(ip tuntap list | cut -d: -f1 | sort)
IFACE=$(comm -13 <(echo "$precreationg") <(echo "$postcreation"))

# printf -v macaddr "52:54:%02x:%02x:%02x:%02x" $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff )) $(( $RANDOM & 0xff)) $(( $RANDOM & 0xff ))
macaddr="52:54:8e:ef:70:17"

twmnc -t "Win10-VM" -c "starting"

taskset -c 2-11 qemu-system-x86_64 \
        -nodefaults \
        -nodefconfig \
        -no-user-config \
        -boot d \
        -cpu host,kvm=off,hv_time,hv_relaxed,hv_spinlocks=0x1fff,hv_vendor_id=null \
        -enable-kvm \
        -machine pc,accel=kvm,mem-merge=off \
        -m 16384 \
        -mem-path /dev/hugepages/libvirt/qemu/win10 \
        -mem-prealloc \
        -realtime mlock=on \
        -rtc base=localtime,clock=host,driftfix=none \
        -no-hpet \
        -drive file=$uefi_code_path,if=pflash,format=raw,readonly=on \
        -drive file=$uefi_vars_path,if=pflash,format=raw \
        -vga qxl \
        -serial none \
        -parallel none \
        -usb \
	\
        -drive file="$vm_disk",if=none,format=qcow2,id=disk0,cache=writeback \
        -object iothread,id=iothread0 \
        -device virtio-blk-pci,scsi=off,drive=disk0,id=virtio-disk0,bootindex=1,iothread=iothread0 \
	\
        -drive file="$win_iso",media=cdrom \
        -drive file="$virtio_iso",media=cdrom \
	\
	-soundhw hda \
	\
	-net nic,model=virtio,macaddr=$macaddr \
	-net tap,ifname="$IFACE" \
	\
        -monitor tcp:127.0.0.1:1234,server,nowait

sudo ip link set dev $IFACE down &> /dev/null
sudo ip tuntap del $IFACE mode tap &> /dev/null

twmnc -t "Win10-VM" -c "shut down"
