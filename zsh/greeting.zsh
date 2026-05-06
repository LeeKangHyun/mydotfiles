# greeting - 터미널 시작 배너
if command -v figlet &>/dev/null && command -v lolcat &>/dev/null; then
    figlet -w 90 -f tanja -c Hello Kangto | lolcat
    echo ''
fi

if command -v fortune &>/dev/null && command -v cowsay &>/dev/null; then
    fortune -s computers | cowsay -f dragon-and-cow | lolcat
    echo ''
fi

if command -v fastfetch &>/dev/null; then
    fastfetch
fi
