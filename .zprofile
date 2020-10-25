# I honestly have no idea what this is.
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Defualt programs
export TERMINAL=/usr/bin/kitty
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/brave
export READER="zathura"

# /~ Clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export CARGO_HOME="$XDG_DATA_HOME"/cargo # For rusts cargo

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# Increase monitor gamme
#xgamma -quiet -gamma 1.3
