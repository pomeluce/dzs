export GIT_TERMINAL_PROMPT=1

# git log 颜色控制
hashColor='#98c379'
headColor='#ef6c00'
contentColor="#ffeb3b"
dateColor="#2196f3"
authorColor="#ff5252"

alias gc='git clone ${1}'
alias gco='git checkout'
alias gpu='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpd='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git --no-pager diff'
alias gs='git --no-pager status'
alias gss='git --no-pager status -s'
alias gpt='git push origin --tags'
alias gtl='git tag -n --sort=taggerdate'
ga() { git add "$*" }
gt() { git tag -a $1 -m "$2" }
gm() { git commit -m "$*" }
gam() { git add --all && git commit -m "$*" }
git_log() { git --no-pager log --date=format:'%Y-%m-%d %H:%M'  --pretty=tformat:$1 --graph -n ${2-10} }
gll() { git_log "%C(${hashColor})%h %C(${contentColor})%s%Creset" $1 }

glla() { git_log "%C(${hashColor})%h %C(${dateColor})%cd %C(${authorColor})%cn: %C(${contentColor})%s%C(${headColor})%d%Creset" $1 }
