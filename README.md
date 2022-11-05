# Vestel 14MB24A cihazına Arch Linux dağıtımında dokunmatik sürücülerini yükleme

`5.0+` kernel sürümlerinde çalışmaktadır. Gerekli bağımlılıklar karşılanırsa başarılı bir şekilde derleme ve kurma işlemi tamamlanır.

## Bağımlılıklar:
* `base-devel`
* `systemd`
* `dkms`
* `'kullanılan-cekirdek'-headers` -> `linux-zen-headers`, `linux-headers`, `linux-lts-headers`, `linux-mainline-headers` gibi

* `usbutils`

## Sürücünün derlenmesi ve kurulması

#### Manuel yöntem:

* #: `root` kullanıcısı / yetkileri
* $: `normal` kullanıcı

```
$ git clone https://github.com/abdullah-rgb/eta-touchdrv ~/eta-touchdrv
$ cd ~/eta-touchdrv/usr/

# cp -rv bin /usr/bin
# cp -rv share /usr/share
# cp -rv lib /usr/lib
# cp -rv src /usr/src

$ cd /usr/src/eta-touchdrv/touch2
# make
# insmod OpticalDrv.ko
$ cd ../touch4
# make
# insmod OtdDrv.ko
$ cd ..
# dkms install .

# systemctl start eta-touchdrv && systemctl enable eta-touchdrv
# systemctl start touchdrv-start && systemctl enable touchdrv-start
```

#### Otomatik yöntem:

* #: `root` kullanıcısı / yetkileri
* $: `normal` kullanıcı

```
$ git clone https://github.com/abdullah-rgb/eta-touchdrv ~/eta-touchdrv
$ cd ~/eta-touchdrv/package
$ makepkg -sc
# ./uninstall.sh
# pacman -U eta-touchdrv*
```
