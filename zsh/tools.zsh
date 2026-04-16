# tools - 외부 도구 연동

# ghostty shell integration
if [[ -n /Applications/Ghostty.app/Contents/Resources/ghostty ]]; then
  source /Applications/Ghostty.app/Contents/Resources/ghostty/shell-integration/zsh/ghostty-integration
fi

# mise
eval "$(mise activate zsh)"

# lazygit
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# kiro
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# direnv
if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi
