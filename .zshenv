if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export EDITOR=nvim
export BROWSER=/usr/bin/firefox
export MOZ_ENABLE_WAYLAND=1
# export PATH=$PATH:/home/emadou/.local/bin
export LC_ALL=en_US.UTF-8
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export TERMINAL=alacritty
export XDG_PICTURES_DIR="~/Pictures"
export _JAVA_AWT_WM_NONREPARENTING=1
