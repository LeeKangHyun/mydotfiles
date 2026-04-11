# .zshrc - 모듈 로더
# 모든 설정은 zsh/ 디렉토리의 개별 모듈에서 관리

ZDOTDIR_MODULES="${${(%):-%x}:A:h}"

# 모듈 로드 순서가 중요: exports -> omz -> 나머지
source "$ZDOTDIR_MODULES/exports.zsh"
source "$ZDOTDIR_MODULES/omz.zsh"
source "$ZDOTDIR_MODULES/history.zsh"
source "$ZDOTDIR_MODULES/aliases.zsh"
source "$ZDOTDIR_MODULES/fzf.zsh"
source "$ZDOTDIR_MODULES/tools.zsh"
source "$ZDOTDIR_MODULES/greeting.zsh"
