# tab 补全
autoload -U compinit && compinit
# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit zrecompile

# 如果 cache 目录未设置, 则使用默认的 cache 目录
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$DZS/cache"
fi

# 获取主机名
SHORT_HOST="${HOST/.*/}"
