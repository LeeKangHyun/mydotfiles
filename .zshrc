# exa 설치 유무에 따른 분기 처리
if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'
    alias l.='ls -d .* --color=auto'
else
    alias ls='eza --icons --color=always --time-style="long-iso"'
    alias l.='ls -dG .*'
fi

alias ll="ls -alh"

alias port='lsof -i -nP | grep LISTEN | awk "{print \$(NF-1), \$1, \$2}" | sort -u'
alias dflush='sudo dscacheutil -flushcache'
alias blekill='sudo pkill bluetoothd'
alias ffind='fzf --preview "bat --color=always --line-range=:500 {}" --bind "enter:become(vim {})"'

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias rm="rm -iv"
alias mv="mv -i"
alias cp="cp -i"
alias history="fc -li 1"

# increase history size
# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTSIZE=1000000
export SAVEHIST=1000000
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# fzf setting
export FZF_DEFAULT_COMMAND='fd -t f -t l -H -E ".*/*" --color=always'
export FZF_DEFAULT_OPTS="
--layout=reverse
--ansi
--bind 'ctrl-u:half-page-up,ctrl-d:half-page-down'
--bind 'ctrl-p:preview-half-page-up,ctrl-n:preview-half-page-down'
--bind '?:toggle-preview'
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
"

# arch에 따라서 brew path 세팅
if [ "$(arch)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

