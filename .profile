if [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/local/bin/run-sway.execline
fi
