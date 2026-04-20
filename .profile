export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/config"
export PAGER="kak"
if [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/local/bin/run-sway.execline
fi
