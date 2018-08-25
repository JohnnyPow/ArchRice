#!/bin/sh

ip tuntap add user jonas mode tap
ip link set tap0 up promisc on
brctl addif br0 tap0
