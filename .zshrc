if ls --version > /dev/null 2>&1; then
    alias ls='ls --color=auto'; #gnu
    alias l.='ls -d .* --color=auto'
else
    # alias ls='ls -G'; #osx
    # alias ls='gls --color=tty --time-style="+%Y-%m-%d %a %H:%M:%S"'; #osx
    alias ls='exa --time-style="long-iso"'; #osx
    alias l.='ls -dG .*'
fi

alias ls="exa"
alias ll="exa --time-style='long-iso' -alh"
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

