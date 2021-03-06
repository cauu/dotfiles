#!/bin/sh

BIN_NAME=$(basename $0)
COMMAND_NAME=$1
SUB_COMMAND_NAME=$2

sub_help () {
    echo "Usage: $BIN_NAME <command>\n"
    echo "Commands:"
    echo "   help               This help message"
    echo "   edit               Open dotfiles in default editor ($EDITOR) and Git GUI ($GIT_GUI)"
    echo "   reload             Reload dotfiles"
    echo "   update             Update packages and pkg managers: OS X Applications, Homebrew/Cask, pip"
    echo "   osx                Apply OS X system defaults"
    echo "   dock               Apply OS X Dock settings"
    echo "   install django     Install virtualenv&wrapper (PIP)"
    echo "   install osx        Install app&clt for osx"
}

sub_edit () {
    sh -c "$EDITOR --cmd 'cd $DOTFILES_DIR' $DOTFILES_DIR"
}

sub_install () {
    local SCRIPT="${DOTFILES_DIR}/install/${SUB_COMMAND_NAME}.sh"
    [ -f "$SCRIPT" ] && source "$SCRIPT" || echo "Unable to find script to install ${SUB_COMMAND_NAME}"
}

sub_reload () {
    source ~/.bash_profile && echo "Bash reloaded."
}

sub_osx () {
    for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults*.sh; do
        [ -f "$DEFAULTS_FILE" ] && echo "Applying $DEFAULTS_FILE" && source "$DEFAULTS_FILE"
    done
    echo "Done. Some changes may require a logout/restart to take effect."
}

sub_dock () {
    source "$DOTFILES_DIR/osx/dock.sh" && echo "Dock reloaded."
}

sub_update () {
    sudo softwareupdate -i -a
    brew update
    brew upgrade
    # pip install --upgrade pip
    # pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
}


case $COMMAND_NAME in
    "" | "-h" | "--help")
        sub_help
        ;;
    *)
        shift
        sub_${COMMAND_NAME} $@
        if [ $? = 127 ]; then
            echo "'$COMMAND_NAME' is not a known command or has errors." >&2
            sub_help
            exit 1
        fi
        ;;
esac

