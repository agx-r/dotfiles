export PATH="$PATH:/usr/local/bin:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/config"
export PAGER="kak"
export QT_STYLE_OVERRIDE="Windows"
if [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/local/bin/run-sway.execline
fi
