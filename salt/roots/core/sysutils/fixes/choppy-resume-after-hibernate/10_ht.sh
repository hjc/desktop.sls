#!/bin/sh
# Disable hyper-threading processor cores on suspend and hibernate, re-enable them
# on resume. Presumably helps for buggy nvidia behaviour.
# This file goes into /etc/pm/sleep.d/
case $1 in
hibernate|suspend)
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 0 > /sys/devices/system/cpu/cpu3/online
;;
thaw|resume)
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu3/online
;;
esac
