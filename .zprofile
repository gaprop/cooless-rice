# I honestly have no idea what this is.
#export QT_QPA_PLATFORMTHEME="qt5ct"
#export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# Defualt programs
export TERMINAL=/usr/bin/kitty
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/brave
export READER="zathura"

"Add .local/bin to path"
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# /~ Clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# Programs that needs a little extra help understanding cleanup
export CARGO_HOME="$XDG_DATA_HOME"/cargo # For rusts cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc # For gtk
export _Z_DATA="$XDG_DATA_HOME"/z # For z

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

# Increase monitor gamme
#xgamma -quiet -gamma 1.3
