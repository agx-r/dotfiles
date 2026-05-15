export PATH="$PATH:/usr/local/bin:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/config"
export PAGER="kak"
export QT_STYLE_OVERRIDE="Windows"

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/ua/.opam/opam-init/init.sh' && . '/home/ua/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

if [ "$(tty)" = "/dev/tty1" ]; then
    exec /usr/local/bin/run-sway.execline
fi
