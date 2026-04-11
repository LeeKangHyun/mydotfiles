# history 설정
export HISTSIZE=1000000
export SAVEHIST=1000000

setopt HIST_IGNORE_ALL_DUPS      # 중복 명령어 히스토리에 넣지 않음
setopt HIST_SAVE_NO_DUPS         # 중복 명령어 저장하지 않음
setopt HIST_REDUCE_BLANKS        # 불필요한 공백 제거
setopt INC_APPEND_HISTORY_TIME   # 실행 즉시 히스토리 파일에 추가
setopt EXTENDED_HISTORY          # 명령어 시작 시간 기록
