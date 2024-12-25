lazy_load_vfox() {
  if command -v vfox &> /dev/null; then
    eval "$(vfox activate zsh)"
  fi
  unset -f lazy_load_vfox
}

add-zsh-hook preexec lazy_load_vfox
