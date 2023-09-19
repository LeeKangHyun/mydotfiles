# exa 설치 유무에 따른 분기 처리
if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'
    alias l.='ls -d .* --color=auto'
else
    alias ls='exa --time-style="long-iso"'
    alias l.='ls -dG .*'
fi

alias ll="ls -alh"

alias port='lsof -i -nP | grep LISTEN | awk "{print \$(NF-1), \$1, \$2}" | sort -u'
alias dflush='sudo dscacheutil -flushcache'
alias blekill='sudo pkill bluetoothd'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias rm="rm -iv"
alias mv="mv -i"
alias cp="cp -i"

# increase history size
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# fzf setting
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_DEFAULT_OPTS="
--bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'
--bind 'ctrl-p:preview-half-page-up,ctrl-n:preview-half-page-down'
--bind '?:toggle-preview'
"

# arch에 따라서 brew path 세팅
if [ "$(arch)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

