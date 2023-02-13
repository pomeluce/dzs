ga() { git add "$*" }
gm() { git commit -m "$*" }
gam() { git add --all && git commit -m "$*" }
gll() {
  git log --pretty=format:'%C(#98c379)%h %C(#26c6da)%ad%C(#ff5252): %C(#b0bec5)%s%C(#ef6c00)%d %C(#3eb370)<%an>' --graph --date=short
}
