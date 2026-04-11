# fzf 설정 (dracula 테마)
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
