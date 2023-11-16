if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
export PATH=$PATH:/home/emadou/.local/bin:/home/emadou/gits/flutter/bin:/home/emadou/.cargo/bin
export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export MOZ_ENABLE_WAYLAND=1
# export PATH=$PATH:/home/emadou/.local/bin
export LC_ALL=en_US.UTF-8
export QT_QPA_PLATFORM=wayland
export TERMINAL=alacritty
export XDG_PICTURES_DIR="~/Pictures"
export XDG_CONFIG_HOME="/home/emad/.config"
export _JAVA_AWT_WM_NONREPARENTING=1
