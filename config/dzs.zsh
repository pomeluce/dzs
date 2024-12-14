source $DZS/libs/dzs.zsh
source $DZS/libs/completion.zsh
source $DZS/libs/directories.zsh
source $DZS/libs/grep.zsh
source $DZS/libs/history.zsh
source $DZS/libs/key-bindings.zsh
source $DZS/libs/theme-appearence.zsh
source $DZS/libs/git.zsh
source $DZS/theme/dzs.zsh-theme

source $DZS/plugins/init.zsh

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
  if [[ $P10K == true && -d $DZS/plugins/powerlevel10k ]]; then
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
add-zsh-hook precmd _load_p10k
add-zsh-hook precmd _load_sudo
add-zsh-hook precmd _load_z
add-zsh-hook precmd _load_zsh-syntax-highlighting
_load_zsh-autosuggestions
