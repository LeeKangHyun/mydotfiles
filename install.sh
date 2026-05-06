#!/usr/bin/env bash
#
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup"

mkdir -p "$BACKUP_DIR"

##
echo "======== Homebrew가 설치되어 있는지 검사합니다. ========"
if ! command -v brew &> /dev/null; then
    echo "Homebrew가 설치되어 있지 않습니다."

    read -p "Homebrew를 설치하시겠습니까? (y/n): " install_brew

    if [ "$install_brew" == "y" ]; then
        # https://brew.sh/index_ko
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "Homebrew가 설치되었습니다."
    fi
else
    echo "Homebrew가 이미 설치되어 있습니다."
fi
echo

##
echo "======== Brewfile 실행을 준비합니다. ========"
read -p "환경을 선택하세요 (home/work) [home]: " env_type
env_type="${env_type:-home}"

if [ "$env_type" != "home" ] && [ "$env_type" != "work" ]; then
    echo "home 또는 work만 입력 가능합니다."
    exit 1
fi

echo "공통 패키지를 설치합니다..."
brew bundle --file="$DOTFILES_DIR/Brewfile.common"

echo "$env_type 전용 패키지를 설치합니다..."
brew bundle --file="$DOTFILES_DIR/Brewfile.$env_type"
echo

##
echo "======== | symlink 연결 | ========"
create_symlink() {
  src=$1
  destination=$2

  if [ ! -e "$destination" ]; then
    ln -s "$src" "$destination"
    echo "연결 완료"
    return 0
  fi

  echo "$destination 이 이미 있어"
  read -p "교체할래? (y/n) -> " input

  if [ "$input" == "y" ]; then
    mv "$destination" "$BACKUP_DIR/"
    ln -s "$src" "$destination"
    echo "교체 완료"
  else
    echo "pass~"
  fi
}

create_symlink "$DOTFILES_DIR/.ideavimrc" "$HOME/.ideavimrc"
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"

mkdir -p "$HOME/.config/fastfetch"
create_symlink "$DOTFILES_DIR/fastfetch/config.jsonc" "$HOME/.config/fastfetch/config.jsonc"
