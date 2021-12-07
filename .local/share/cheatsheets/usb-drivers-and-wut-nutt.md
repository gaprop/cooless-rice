Når du vil mount så bare husk
sudo mount /dev/sdb1 /mnt/

Og husk at unmount!!
sudo umount /dev/sdb1

reset usb (sådan da)
sudo wipefs --all /dev/sdb (vær lige opmæskom på hvilken driver det er)

sudo cfdisk /dev/sdb

Her vælger du så bare dos
Derefter new hvor du bare trykker enter
Til sidst trykker du write
Til sidst quit

sudo mkfs.vfat /dev/sdb1

