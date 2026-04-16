# mydotfiles

macOS 개발 환경 설정 dotfiles. symlink 기반으로 관리합니다.

## 구조

```
mydotfiles/
├── zsh/
│   ├── .zshrc           # 모듈 로더
│   ├── aliases.zsh      # alias (ls, grep, k8s, claude 등)
│   ├── exports.zsh      # PATH, 환경변수, locale
│   ├── fzf.zsh          # fzf 설정 + dracula 테마
│   ├── greeting.zsh     # 시작 배너 (figlet, fortune, neofetch)
│   ├── history.zsh      # history 설정
│   ├── omz.zsh          # oh-my-zsh (theme, plugins)
│   └── tools.zsh        # 도구 연동 (ghostty, mise, lazygit 등)
├── dracula/             # dracula zsh 테마
├── .gitconfig
├── .ideavimrc
├── .zprofile
├── Brewfile.common      # 공통 패키지
├── Brewfile.home        # 집 전용 패키지
├── Brewfile.work        # 회사 전용 패키지
├── install.sh
└── README.md
```

## 설치

```bash
git clone https://github.com/LeeKangHyun/mydotfiles.git ~/Documents/mydotfiles
cd ~/Documents/mydotfiles
./install.sh
```

install.sh가 하는 일:

1. Homebrew 설치 확인
2. 환경 선택 (home/work, 기본값: home) 후 Brewfile 실행
3. symlink 연결 (.zshrc, .zprofile, .ideavimrc)

## symlink 목록

| 원본 | 링크 |
|------|------|
| `zsh/.zshrc` | `~/.zshrc` |
| `.zprofile` | `~/.zprofile` |
| `.ideavimrc` | `~/.ideavimrc` |

## zsh 모듈

`.zshrc`는 로더 역할만 하고, 실제 설정은 `zsh/` 아래 모듈로 분리되어 있습니다.

| 모듈 | 역할 |
|------|------|
| `exports.zsh` | brew, Android SDK, Go, curl 등 PATH 및 환경변수 |
| `omz.zsh` | oh-my-zsh 테마(dracula), 플러그인(git, syntax-highlighting) |
| `history.zsh` | 히스토리 크기, 중복 제거, 즉시 저장 |
| `aliases.zsh` | eza, bat, grep, k8s, claude 등 alias |
| `fzf.zsh` | fzf 기본 명령어, 키바인딩, dracula 색상 |
| `tools.zsh` | ghostty, mise, lazygit, direnv, kiro, ngrok 연동 |
| `greeting.zsh` | figlet, fortune, neofetch 시작 배너 |

모듈 로드 순서: exports -> omz -> history -> aliases -> fzf -> tools -> greeting

## Brewfile

환경별로 분리되어 있습니다.

- `Brewfile.common` - CLI 도구, 공통 앱, 폰트
- `Brewfile.home` - 개인용 도구 및 앱 (fortune, neofetch, itsycal)
- `Brewfile.work` - 회사 전용 도구 및 앱 (glab)
