if [[ ! -d $DZS/plugins/fzf-tab ]]; then
  echo 'downloading and installing fzf-tab'
  git clone 'https://github.com/Aloxaf/fzf-tab.git' $DZS/plugins/fzf-tab &>/dev/null
fi

if [[ $P10K == true && ! -d $DZS/plugins/powerlevel10k ]]; then
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


function _load_extract() {
  source $DZS/plugins/extract/extract.plugin.zsh
  unset -f _load_extract
}

function _load_sudo() {
  source $DZS/plugins/sudo/sudo.plugin.zsh
  unset -f _load_sudo
}

function _load_fzf() {
  if [[ -f "$DZS/plugins/fzf-tab/fzf-tab.zsh" ]]; then
    source $DZS/plugins/fzf-tab/fzf-tab.zsh
  fi
  unset -f _load_fzf
}

function _load_p10k() {
  if [[ -d $DZS/plugins/powerlevel10k ]]; then
    source $DZS/plugins/powerlevel10k/powerlevel10k.zsh-theme
  fi
  unset -f _load_p10k
}

function _load_z() {
  if [[ -d $DZS/plugins/z.lua ]]; then
    source $DZS/plugins/z.lua/z.lua.plugin.zsh
  fi
  unset -f _load_z
}

function _load_zsh-autosuggestions() {
  if [[ -d $DZS/plugins/zsh-autosuggestions ]]; then
    source $DZS/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  fi
  unset -f _load_zsh-autosuggestions
}

function _load_zsh-syntax-highlighting() {
  if [[ -d $DZS/plugins/zsh-syntax-highlighting ]]; then
    source $DZS/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi
  unset -f _load_zsh-syntax-highlighting
}

add-zsh-hook precmd _load_extract
add-zsh-hook precmd _load_fzf
add-zsh-hook precmd _load_sudo
add-zsh-hook precmd _load_z
add-zsh-hook precmd _load_zsh-syntax-highlighting
_load_zsh-autosuggestions
[[ $P10K == true ]] && _load_p10k
