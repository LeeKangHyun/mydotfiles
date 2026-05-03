# aliases - 모든 alias 정의

# ls/eza
if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'
    alias l.='ls -d .* --color=auto'
else
    alias ls='eza --icons --color=always --time-style="long-iso"'
    alias l.='ls -dG .*'
fi
alias ll="ls -alh"

# 시스템 유틸리티
alias port='lsof -i -nP | grep LISTEN | awk "{print \$(NF-1), \$1, \$2}" | sort -u'
alias dflush='sudo dscacheutil -flushcache'
alias blekill='sudo pkill bluetoothd'
alias ffind='fzf --preview "bat --color=always --line-range=:500 {}" --bind "enter:become(vim {})"'

# 기본 명령어 개선
alias cat='bat --paging=never'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias rm="rm -iv"
alias mv="mv -i"
alias cp="cp -i"
alias jqc='jq -C "$@" | less -R'
alias history="fc -li 1"

# k8s
alias k='kubectl'
alias kubectl="minikube kubectl --"

# claude code
alias clp="claude --dangerously-skip-permissions"
alias cld="claude --debug"
alias clr="claude --resume"

# codex
alias cop="codex --yolo"

