#!/usr/bin/env bash
#
BACKUP_DIR="~/.dotfiles-backup"

mkdir -p "$BACKUP_DIR"

##
echo "======== Homebrew가 설치되어 있는지 검사합니다. ========"
if ! command -v brew &> /dev/null; then
    echo "Homebrew가 설치되어 있지 않습니다."

    read -p "$INDENT Homebrew를 설치하시겠습니까? (y/n): " install_brew

    if [ "$install_brew" == "y" ]; then
        # https://brew.sh/index_ko
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        echo "$INDENT Homebrew가 설치되었습니다."
    fi
else
    echo "$INDENT Homebrew가 이미 설치되어 있습니다."
fi
echo "\n"

##
echo "======== Brewfile 실행을 준비합니다. ========"
if [ ! -e ./Brewfile ]; then
    echo " Brewfile이 현재 경로에 없습니다."
    exit 1
fi

if [ -e ./Brewfile ]; then
    echo "Brewfile이 현재 경로에 있습니다."
    read -p "brew bundle dump를 실행하시겠습니까? (y/n) -> " user_input

    if [ "$user_input" == "y" ]; then
        echo "brew bundle dump를 실행합니다."
        brew bundle dump
    fi
fi
echo "\n"

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

create_symlink ./.ideavimrc ~/.ideavimrc
