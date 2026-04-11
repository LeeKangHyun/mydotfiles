# exports - PATH, 환경변수, locale

# arch에 따라서 brew path 세팅
if [ "$(arch)" = "arm64" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

# React Native / Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"

# go
export PATH="/usr/local/go/bin:$PATH"

# claude code
export PATH="/Users/kangto/.local/bin:$PATH"

# windsurf
export PATH="/Users/kangto/.codeium/windsurf/bin:$PATH"

# antigravity
export PATH="/Users/kangto/.antigravity/antigravity/bin:$PATH"

# lazygit
export XDG_CONFIG_HOME="$HOME/.config"

# EZA 색상
export EZA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# locale
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8

# default editor
export EDITOR="zed-editor"

# ECC hooks
export ECC_DISABLED_HOOKS="stop:desktop-notify"
