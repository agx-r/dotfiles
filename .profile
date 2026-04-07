export PATH="$PATH:$HOME/.local/bin"
export PAGER="hx"
if [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/local/bin/run-sway.execline
fi
