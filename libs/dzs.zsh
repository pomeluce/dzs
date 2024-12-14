# Load add-zsh-hook
autoload -Uz add-zsh-hook
# disable autocorrect
unsetopt correct
# tab 补全
autoload -U compinit && compinit
# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit zrecompile

# 如果 cache 目录未设置, 则使用默认的 cache 目录
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$DZS/cache"
fi

# 默认执行历史命令绑定
if [[ -z "$DZS_HISTORY_SHOW" ]]; then
  DZS_HISTORY_SHOW=true
fi

# 自动进入上次退出目录, 默认不开启
if [[ -z "$DZS_IN_LASTDIR" ]]; then
  DZS_IN_LASTDIR=false
fi

# 获取主机名
SHORT_HOST="${HOST/.*/}"

# ctrl + r 展开 history 列表, 并查找
dzs_history_show() {
  function fzf_history_list (){
    if [ $#LBUFFER -gt 0 ]; then
      BUFFER=$(history -n | awk '!seen [$0]++' | fzf --query $LBUFFER)
    else
      BUFFER=$(history -n | awk '!seen [$0]++' | fzf)
    fi
    CURSOR=$#BUFFER
    zle redisplay
  }
  zle -N fzf_history_list
  bindkey '^r' fzf_history_list
}

# 进入终端时, 自动 cd 到上次的目录
dzs_in_lastdir() {
  chpwd_hook() { echo $PWD > $DZS/cache/currentdir }
  add-zsh-hook -Uz chpwd chpwd_hook
  currentdir=$(cat $DZS/cache/currentdir 2>/dev/null || echo "")
  [ -d "$currentdir" ] && cd $currentdir
}


# define last command
LAST_CMD=""
IS_FIRST=true

dzs_precmd_hook() {
  if [[ $IS_FIRST == true || $LAST_CMD == "clear" || $LAST_CMD == "reset" || $LAST_CMD == "tput clear" ]]; then
    LAST_CMD="" # reset
  else
    echo  # add new line
  fi
  IS_FIRST=false
}

# preexec hook, set last command
dzs_preexec_hook() {
  LAST_CMD="$1"
}

add-zsh-hook precmd dzs_precmd_hook
add-zsh-hook preexec dzs_preexec_hook
