# Commands jeg helt klart glemmer
sxiv (image viewer)

# Crypto  
curl rate.sx

# Wheather
curl wttr.in

# Screen stuff
xrandr (for bare at se forskellige skærme)
xrandr --output HDMI1 --auto (for at skifte til HDMI 1 med auto opløsning)
(bare check arch wiki, den er squ meget fin)

# USB drivers and what not
## Når du vil mount så bare husk
sudo mount /dev/sdb1 /mnt/

Og husk at unmount!!
sudo umount /dev/sdb1

## reset usb (sådan da)
sudo wipefs --all /dev/sdb (vær lige opmæskom på hvilken driver det er)

sudo cfdisk /dev/sdb

Her vælger du så bare dos
Derefter new hvor du bare trykker enter
Til sidst trykker du write
Til sidst quit

sudo mkfs.vfat /dev/sdb1

# yay and pacman
## Fjern et program ordentligt
yay -Rns | pacman -Rns
