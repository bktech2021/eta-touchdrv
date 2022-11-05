#!/usr/bin/bash

cd /usr/bin/
rm -rf OpticalService Otd* touchdrv_install calibrationTools

cd /usr/src/
dkms remove eta-touchdrv/__VERSION__
dkms uninstall eta-touchdrv/__VERSION__
rm -rf /var/lib/dkms/eta-touchdrv
rm -rf eta*

systemctl stop eta-touchdrv
systemctl disable eta-touchdrv

systemctl stop touchdrv-start
systemctl disable touchdrv-start

cd /usr/lib/systemd/system/
rm -rf eta-touchdrv.service
rm -rf touchdrv-start.service

modprobe -r OpticalDrv
modprobe -r OtdDrv

rm -rf /lib/udev/rules.d/60-eta-touchdrv.rules

rm -rf /usr/share/doc/eta-touchdrv
rm -rf /usr/share/lintian/overrides/eta-touchdrv