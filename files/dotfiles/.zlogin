[[ -z $DISPLAY ]] && systemctl --user start multi-user.target
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
