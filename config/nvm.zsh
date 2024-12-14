lazy_load_nvm() {
  if [ "$(whence -w nvm)" != "*function*" ]; then
    source /usr/share/nvm/init-nvm.sh
  fi
  unset -f lazy_load_nvm
}

add-zsh-hook preexec lazy_load_nvm
