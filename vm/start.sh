#!/bin/bash

notify () {
  echo "$1"
  twmnc -t "Win10-VM" -c "$1"
}

if [[ $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  notify "already running"
  exit
fi

cd /home/$SUDO_USER

vfio_gpu_device="0000:03:00.0"
vfio_gpu_audio="0000:03:00.1"
vm_disk="Virtual Disks/win10.qcow2"
virtio_iso="Downloads/virtio-win-0.1.141.iso"
uefi_code_path=".vfio/OVMF_CODE.fd"
uefi_vars_path=".vfio/OVMF_VARS.bin"
macaddr="52:54:8e:ef:70:17"

export QEMU_PA_SERVER="/run/user/$(id -u "$SUDO_USER")/pulse/native"
export QEMU_PA_SAMPLES=128
export QEMU_AUDIO_DRV=pa
cp .config/pulse/cookie /root/.config/pulse/cookie

IFACE=tap0

notify "starting"

echo 'performance' | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null

taskset -c 2-11 qemu-system-x86_64 \
        -nodefaults \
        -nodefconfig \
        -no-user-config \
        -boot d \
        -cpu host,kvm=off,hv_time,hv_relaxed,hv_spinlocks=0x1fff,hv_vendor_id=null \
        -smp cpus=10,sockets=1,cores=10,threads=1 \
        -vcpu vcpunum=0,affinity=2 \
        -vcpu vcpunum=1,affinity=3 \
        -vcpu vcpunum=2,affinity=4 \
        -vcpu vcpunum=3,affinity=5 \
        -vcpu vcpunum=4,affinity=6 \
        -vcpu vcpunum=5,affinity=7 \
        -vcpu vcpunum=6,affinity=8 \
        -vcpu vcpunum=7,affinity=9 \
        -vcpu vcpunum=8,affinity=10 \
        -vcpu vcpunum=9,affinity=11 \
        -enable-kvm \
        -machine pc,accel=kvm,mem-merge=off \
        -m 16384 \
        -mem-path /dev/hugepages \
        -mem-prealloc \
        -realtime mlock=on \
        -rtc base=localtime,clock=host,driftfix=none \
        -no-hpet \
        -drive file=$uefi_code_path,if=pflash,format=raw,readonly=on \
        -drive file=$uefi_vars_path,if=pflash,format=raw \
        -vga none \
        -nographic \
        -serial none \
        -parallel none \
        -device vfio-pci,host=$vfio_gpu_device \
        -device vfio-pci,host=$vfio_gpu_audio \
        -usb \
        -drive file="$vm_disk",if=none,format=qcow2,id=disk0,cache=writeback \
        -object iothread,id=iothread0 \
        -device virtio-blk-pci,scsi=off,drive=disk0,id=virtio-disk0,bootindex=1,iothread=iothread0 \
	\
	-drive file="$virtio_iso",media=cdrom \
	-soundhw ac97 \
	\
	-net nic,model=virtio,macaddr=$macaddr \
	-net tap,ifname="$IFACE",script=no,downscript=no \
	\
        -monitor tcp:127.0.0.1:1234,server,nowait

echo 'powersave' | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null

notify "shut down"
