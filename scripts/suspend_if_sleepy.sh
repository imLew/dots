#!/bin/zsh
if [[ -e /opt/was_awake ]]; then
    rm /opt/was_awake
    echo "was awake before cron, not suspending"
else
    echo "only woke to download wallpaper, going to sleep"
    systemctl suspend
fi
