## dzs
```
代码 fork 自 oh-my-zsh, 对 oh-my-zsh 进行大幅度精简, 只保留部分需要代码, 并对 fzf p10k z.lua 等进行了整合
, 添加了 git 脚本, 更轻便的执行 git 命令.
```
## 目录结构
```
.
├── cache
├── config
├── libs
└── plugins
    ├── extract
    ├── fzf-tab
    ├── powerlevel10k
    ├── sudo
    ├── z.lua
    ├── zsh-autosuggestions
    └── zsh-syntax-highlighting
```
## 可选配置

| 参数               | 默认值                              | 说明                       |
| ------------------ | ----------------------------------- | -------------------------- |
| EXC_FOLDERS        | {.bzr,CVS,.git,.hg,.svn,.idea,.tox} | 设置 grep 命令要忽略的目录 |
| ZSH_CACHE_DIR      | $DZS/cache                          | 设置 zsh 的 cache 目录     |
| CASE_SENSITIVE     | false                               | 设置大小写是否敏感         |
| HYPHEN_INSENSITIVE | false                               | 设置连字符不敏感           |
