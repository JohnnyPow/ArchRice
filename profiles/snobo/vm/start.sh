#!/bin/bash

if [[ $(netstat -tln | grep 127.0.0.1:1234) ]]; then
  echo "VM already running"
  exit
fi

cd /home/$SUDO_USER

vfio_gpu_device="0000:02:00.0"
vfio_gpu_audio="0000:02:00.1"
vm_disk="storage_2/hdgdl/win10backup/win10.qcow2"
virtio_iso="Downloads/virtio-win-0.1.149.iso"
uefi_code_path=".vfio/OVMF_CODE.fd"
uefi_vars_path=".vfio/OVMF_VARS.bin"
macaddr="52:54:8e:ef:70:17"

export QEMU_PA_SERVER="/run/user/$(id -u "$SUDO_USER")/pulse/native"
export QEMU_PA_SAMPLES=128
export QEMU_AUDIO_DRV=pa
cp .config/pulse/cookie /root/.config/pulse/cookie

taskset -c 1-3,5-7 qemu-system-x86_64 \
        -nodefaults \
        -nodefconfig \
        -no-user-config \
        -boot d \
        -cpu host,kvm=off,hv_time,hv_relaxed,hv_spinlocks=0x1fff,hv_vendor_id=null \
        -smp cpus=6,sockets=1,cores=6,threads=1 \
        -vcpu vcpunum=0,affinity=1 \
        -vcpu vcpunum=1,affinity=2 \
        -vcpu vcpunum=2,affinity=3 \
        -vcpu vcpunum=3,affinity=5 \
        -vcpu vcpunum=4,affinity=6 \
        -vcpu vcpunum=5,affinity=7 \
        -enable-kvm \
        -machine pc,accel=kvm,mem-merge=off \
        -m 12288 \
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
	-device ich9-intel-hda \
	-device hda-duplex \
	\
	-net nic,model=virtio,macaddr=$macaddr \
	-net tap,ifname=tap0,script=no,downscript=no \
	\
        -monitor tcp:127.0.0.1:1234,server,nowait

