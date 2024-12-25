export DZS=$(cd $(dirname $0);pwd)
source $DZS/config/dzs.zsh
source $DZS/config/git.zsh
source $DZS/config/fzf.zsh
source $DZS/config/vfox.zsh

[[ $DZS_HISTORY_SHOW == false ]] || dzs_history_show
[[ $DZS_IN_LASTDIR == false ]] || dzs_in_lastdir
