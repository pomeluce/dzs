export DZS=$(cd $(dirname $0);pwd)

if [[ ! -d $DZS/plugins/fzf-tab ]]; then
  echo 'downloading and installing fzf-tab'
  git clone 'https://github.com/Aloxaf/fzf-tab.git' $DZS/plugins/fzf-tab &>/dev/null
fi

if [[ ! -d $DZS/plugins/powerlevel10k ]]; then
  echo 'downloading and installing powerlevel10k'
  git clone 'https://github.com/romkatv/powerlevel10k.git' $DZS/plugins/powerlevel10k &>/dev/null
fi

if [[ ! -d $DZS/plugins/z.lua ]]; then
  echo 'downloading and installing z.lua'
  git clone 'https://github.com/skywind3000/z.lua.git' $DZS/plugins/z.lua &>/dev/null
fi

if [[ ! -d $DZS/plugins/zsh-autosuggestions ]]; then
  echo 'downloading and installing zsh-autosuggestions'
  git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' $DZS/plugins/zsh-autosuggestions &>/dev/null
fi

if [[ ! -d $DZS/plugins/zsh-syntax-highlighting ]]; then
  echo 'downloading and installing zsh-syntax-highlighting'
  git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' $DZS/plugins/zsh-syntax-highlighting &>/dev/null
fi

source $DZS/config/dzs.zsh
source $DZS/config/git.zsh
source $DZS/config/fzf.zsh
