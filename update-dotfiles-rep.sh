#!/bin/bash

# Retarded way of updating dotfiles.

configDir=$XDG_CONFIG_HOME
scriptsDir=~/.local/bin

echo 'Copying i3 config...'
cp -r ${configDir}/i3/* ./.config/i3/

echo 'Copying dunst config..'
cp -r ${configDir}/dunst/* ./.config/dunst/

echo 'Copying kitty config..'
cp -r ${configDir}/kitty/* ./.config/kitty/

echo 'Copying polybar config..'
cp -r ${configDir}/polybar/* ./.config/polybar/

echo 'Copying polybar config..'
cp -r ${configDir}/nvim/* ./.config/nvim/

echo 'Copying rofi config..'
cp -r ${configDir}/rofi/* ./.config/rofi/

echo 'Copying spicetify config..'
cp -r ${configDir}/spicetify/Themes/* ./.config/spicetify/Themes/
cp -r ${configDir}/spicetify/config.ini ./.config/spicetify/

echo 'Copying compton config..'
cp -r ${configDir}/picom.conf ./.config/

echo 'Copying .profile..'
cp -r ~/.profile ./

echo 'Copying .zprofile..'
cp -r ~/.zprofile ./

echo 'Copying .zshrc'
cp -r ~/.zshrc ./

echo 'Copying .Xmodmap (key remaps)..'
cp -r ~/.Xmodmap ./

echo 'Copying xresources..'
cp -r ~/.Xresources ./

echo 'Copying xmonad..'
cp -r ${configDir}/xmonad/* ./.config/xmonad/

echo 'Copying zathura'
cp -r ${configDir}/zathura/* ./.config/zathura/

echo 'Copying newsboat'
cp -r ${configDir}/newsboat/* ./.config/newsboat

echo 'Copying scripts from .local'
cp -r ${scriptsDir}/* ./.local/bin
