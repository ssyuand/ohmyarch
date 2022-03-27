declare -A CHECK_FILES
CHECK_FILES=(
	["yay"]="/usr/bin/yay"	
	["fcitx"]="/usr/bin/fcitx"
	["nvim"]="/usr/bin/nvim"
	["xinitrc"]="$HOME/.xinitrc"
	["bashrc"]="$HOME/.bashrc"
	["alacritty"]="/usr/bin/alacritty"
)

declare -A CHECK_DIRS
CHECK_DIRS=(
	["dwm"]="$HOME/.config/dwm/"
)
function check_file_exist {
     for key in "${!CHECK_FILES[@]}"; do
 if [[ $key == $1 ]]; then
     if [ -e ${CHECK_FILES[$key]} ]; then
             return 0
     else
 	return 1
     fi
 fi
 done
 return 1
}
function check_dir_exist {
    for key in "${!CHECK_DIRS[@]}"; do
	if [[ $key == $1 ]]; then
	    if [ -d ${CHECK_DIRS[$key]} ]; then
                return 0
	    else
		return 1
	    fi
	fi
    done
    return 1
}

check_all () {
    for key in "${!CHECK_FILES[@]}"; do
	if !(check_file_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
    done
    for key in "${!CHECK_DIRS[@]}"; do
	if !(check_dir_exist $key); then
	    echo "${RED}check failed: $key${RESET}"
	fi
    done
}
