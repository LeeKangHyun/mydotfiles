#!/usr/bin/env bash
#
BACKUP_DIR="~/.dotfiles-backup"

mkdir -p "$BACKUP_DIR"

echo -e "\nsymlink 연결"
create_symlink() {
  src=$1
  destination=$2

  if [ ! -e "$destination" ]; then
    ln -s "$src" "$destination"
    echo -e "\n연결 완료"
    return 0
  fi

  echo -e "\n $destination 이 이미 있네?"
  read -p "\n replace? (y/n) -> " input

  if [ "$input" == "y" ]; then
    mv "$destination" "$BACKUP_DIR/"
    ln -s "$src" "$destination"
    echo "replace완료"
  else
    echo "pass~"
  fi
}

create_symlink ./.ideavimrc ~/.ideavimrc

