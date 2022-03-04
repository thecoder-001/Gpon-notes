## Networking:

* SSH:
```shell
# User: ONTUSER
# Pass: SUGAR2A041
$ ssh -t -o "ServerAliveInterval 10" ONTUSER@192.168.1.1 "mkdir /mnt/lifeboat; mount /dev/sda1 /mnt/lifeboat; cd /mnt/lifeboat && export TERM='xterm' && TERMINFO='/mnt/lifeboat/terminfo/' ./binaries/bash --rcfile /mnt/lifeboat/root/.bashrc" #SUGAR2A041
```
* Mount usb disk:
```shell
$ fdisk -l
$ mkdir /mnt/lifeboat
$ mount /dev/sda1 /mnt/lifeboat && cd /mnt/lifeboat
```
* Chroot:
```bash
$ cd /mnt/lifeboat
$ mount --bind /path/to/chroot /path/to/chroot
$ cd /mnt/lifeboat && ./binaries/bash chroot.sh /mnt/lifeboat/chroot/mips-rootfs
```
* Enable  ftp server:
```bash
# Starts ftp server at port 29
$ tcpsvd -vE 0.0.0.0 29 ftpd -w /
# Similarly, for port 21
$ tcpsvd -vE 0.0.0.0 21 ftpd -w /
```
* Updated shell:
```bash
$ export TERM='xterm'
# needed to copy those from laptop
$ TERMINFO='/mnt/lifeboat/terminfo/' ./binaries/htop
```
* Restricted shell:
```
admin@192.168.1.1
pass: admin
```
* `cfgcli` to change config
