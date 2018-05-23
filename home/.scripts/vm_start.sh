#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

vfio_gpu_device="0000:03:00.0"
vfio_gpu_audio="0000:03:00.1"
vfio_nic="0000:05:00.0"
vm_disk="Virtual Disks/win10.qcow2"
uefi_code_path=".vfio/OVMF_CODE.fd"
uefi_vars_path=".vfio/ovmf_vars_x64_win10.bin"

killall synergy synergyc
sudo -u $SUDO_USER synergy &

export QEMU_PA_SERVER="/run/user/$(id -u "$SUDO_USER")/pulse/native"
cp .config/pulse/cookie /root/.config/pulse/cookie

taskset -c 6-11 qemu-system-x86_64 \
        -nodefaults \
        -nodefconfig \
        -no-user-config \
        -boot d \
        -cpu host,kvm=off,hv_time,hv_relaxed,hv_spinlocks=0x1fff,hv_vendor_id=null \
        -smp cpus=6,sockets=1,cores=6,threads=1 \
        -vcpu vcpunum=0,affinity=6 \
        -vcpu vcpunum=1,affinity=7 \
        -vcpu vcpunum=2,affinity=8 \
        -vcpu vcpunum=3,affinity=9 \
        -vcpu vcpunum=4,affinity=10 \
        -vcpu vcpunum=5,affinity=11 \
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
        -vga none \
        -nographic \
        -serial none \
        -parallel none \
        -balloon none \
        -device vfio-pci,host=$vfio_gpu_device \
        -device vfio-pci,host=$vfio_gpu_audio \
        -device vfio-pci,host=$vfio_nic \
        -usb \
        -drive file="$vm_disk",if=virtio,format=qcow2 \
        -device intel-hda \
        -device hda-duplex \
        -monitor tcp:127.0.0.1:1234,server,nowait
