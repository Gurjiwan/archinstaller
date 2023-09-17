# This file is for defining environment variables for your login shells.
# These variables may not reflect on a shell that is not a login shell.


# Defining variables for XDG Base Directories.
# Check archlinux wiki for more info.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Setting $ZDOTDIR variable (Default Value = $HOME)
# All zsh user dot files are stored in this directory.
export ZDOTDIR="$HOME/.config/zsh"

#Setting variable for storing passwords with pass
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store" 
