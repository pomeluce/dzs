if [[ ! -d $DZS/plugins/fzf-tab ]]; then
  echo 'downloading and installing fzf-tab'
  git clone 'https://github.com/Aloxaf/fzf-tab.git' $DZS/plugins/fzf-tab &>/dev/null
fi

if [[ $P10K && ! -d $DZS/plugins/powerlevel10k ]]; then
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

if [[ -f "$DZS/plugins/fzf-tab/fzf-tab.zsh" ]]; then
  start_line=$(awk '/fzf-tab-complete\(\) {/{print NR;exit}' "$DZS/plugins/fzf-tab/fzf-tab.zsh")
  end_line=$(awk '/# this name must be ugly to avoid clashes/{print NR;exit}' "$DZS/plugins/fzf-tab/fzf-tab.zsh")

  # 在指定行之间插入文本
  if ((end_line == start_line + 1)); then
    sed -i "${end_line} { /^$/! s|^|  zsh \$DZS/libs/get-cursor.zsh\n|; }" "$DZS/plugins/fzf-tab/fzf-tab.zsh"
  fi
fi
