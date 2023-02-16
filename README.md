## DZS
```
代码 fork 自 oh-my-zsh, 对 oh-my-zsh 进行大幅度精简, 只保留部分需要代码, 并对 fzf p10k z.lua 等进行了整合
, 添加了 git 脚本, 更轻便的执行 git 命令.
```
## 目录结构
```
.
├── cache
│   ├── cursor
│   └── fzfhistory
├── config
│   ├── dzs.zsh
│   ├── fzf.zsh
│   └── git.zsh
├── init.zsh
├── libs
│   ├── completion.zsh
│   ├── directories.zsh
│   ├── dzs.zsh
│   ├── file-preview.zsh
│   ├── get-cursor.sh
│   ├── git.zsh
│   ├── grep.zsh
│   ├── history.zsh
│   ├── img-preview.sh
│   ├── key-bindings.zsh
│   ├── termsupport.zsh
│   └── theme-appearence.zsh
├── LICENSE
├── plugins
│   ├── extract
│   ├── fzf-tab
│   ├── powerlevel10k
│   ├── sudo
│   ├── z.lua
│   ├── zsh-autosuggestions
│   └── zsh-syntax-highlighting
└── README.md
```
## 环境依赖
```
1. 默认 shell 必须为 zsh
2. 需要安装 rg, exa, bat, fzf, ueberzug
```
## 可选配置

| 参数               | 默认值                              | 说明                       |
| ------------------ | ----------------------------------- | -------------------------- |
| EXC_FOLDERS        | {.bzr,CVS,.git,.hg,.svn,.idea,.tox} | 设置 grep 命令要忽略的目录 |
| ZSH_CACHE_DIR      | $DZS/cache                          | 设置 zsh 的 cache 目录     |
| CASE_SENSITIVE     | false                               | 设置大小写是否敏感         |
| HYPHEN_INSENSITIVE | false                               | 设置连字符不敏感           |

## git 命令
<!-- ``` -->
* gc 'url' : git clone 'url'
* gco : git checkout
* gpu: git push origin $(git symbolic-ref --short -q HEAD)
* gpd: git pull origin $(git symbolic-ref --short -q HEAD) --ff-only
* gd: git --no-pager diff
* gs: git --no-pager status
* gss: git --no-pager status -s
* gpt: git push origin --tags
* gtl: git tag -n --sort=taggerdate
* ga 'file' : git add 'file'
* gt 'tag' 'commit': git tag -a 'tag' -m "commit"
* gm 'commit': git commit -m "commit"
* gam 'commit': git add --all && git commit -m "commit"
* gll: git log (short)
* glla: git log (long)
<!-- ``` -->
