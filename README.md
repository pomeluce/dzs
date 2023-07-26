## DZS

```
基于 omz 的源码构建的 zsh 框架, 对 omz 的源码进行了大幅度精简, 根据功能需要整合常用插件, 和部分脚本,
让 zsh 使用更加顺手

1. extract 简化解压操作
2. sudo 快捷执行 sudo 命令
3. fzf-tab 更智能的 tab 补全
4. z.lua 常用目录快捷跳转
5. zsh-autosuggestions       \
                              zsh 提示高亮
6. zsh-syntax-highlighting   /
7. ls 文件展示升级
8. 图片预览
```

### 目录结构

```
 .
├──  cache
│   ├──  currentdir
│   ├──  cursor
│   ├──  dzsHistory
│   ├──  fzfhistory
│   └──  npe
├──  config
│   ├──  dzs.zsh
│   ├──  fzf.zsh
│   └──  git.zsh
├──  init.zsh
├──  libs
│   ├──  completion.zsh
│   ├──  directories.zsh
│   ├──  dzs.zsh
│   ├──  file-preview.zsh
│   ├──  get-cursor.zsh
│   ├──  git.zsh
│   ├──  grep.zsh
│   ├──  history.zsh
│   ├──  img-preview.zsh
│   ├──  key-bindings.zsh
│   ├──  termsupport.zsh
│   └──  theme-appearence.zsh
├──  LICENSE
├──  plugins
│   ├──  extract
│   ├──  fzf-tab
│   ├──  sudo
│   ├──  z.lua
│   ├──  zsh-autosuggestions
│   └──  zsh-syntax-highlighting
├──  README.md
└──  theme
    └──  dzs.zsh-theme
```

### 环境依赖

```
1. 默认 shell 必须为 zsh
2. 需要安装 fd, exa, bat, fzf, ueberzug, lsd, git, lua
```

### 安装使用

1. 切换终端的默认 shell 为 zsh
```zsh
# 查看 zsh  路径
chsh -l | grep zsh

# 切换 shell, 具体 shell 路径以上一条命令查找到的 zsh 路径为准
chsh -s /usr/bin/zsh
```

2. 安装环境依赖项, 某些功能依赖于下面的环境, **可选**
```zsh
# Arch Linux 直接安装
yay/pacman -S fd exa bat fzf ueberzug lsd git lua

# 其他 Linux 发行版以各自对应的包管理器为准进行安装
```

3. 安装 dzs
```zsh
# 使用下面的命令拉取仓库
git clone https://github.com/pomeluce/dzs.git ~/.config/dzs

# 执行如下命令进行配置
echo 'source ~/.config/dzs/init.zsh' >> ~/.zshrc

# 执行如下命令重新加载终端环境
source ~/.zshrc
```

### 可选配置

| 参数             | 默认值                              | 说明                                   |
| ---------------- | ----------------------------------- | -------------------------------------- |
| EXC_FOLDERS      | {.bzr,CVS,.git,.hg,.svn,.idea,.tox} | 设置 grep 命令要忽略的目录             |
| ZSH_CACHE_DIR    | $DZS/cache                          | 设置 zsh 的 cache 目录                 |
| CASE_SENSITIVE   | false                               | 设置大小写是否敏感                     |
| P10K             | fasle                               | 是否开启 powerlevel10k 主题            |
| DZS_IN_LASTDIR   | false                               | 是否在启动时自动进入上次目录           |
| DZS_HISTORY_SHOW | true                                | 绑定 Ctrl + r 快捷键, 展示搜索历史命令 |

### git 命令

<!-- ``` -->

- gc 'url' : git clone 'url'
- gco : git checkout
- gpu: git push origin $(git symbolic-ref --short -q HEAD)
- gpd: git pull origin $(git symbolic-ref --short -q HEAD) --ff-only
- gd: git --no-pager diff
- gs: git --no-pager status
- gss: git --no-pager status -s
- gpt: git push origin --tags
- gtl: git tag -n --sort=taggerdate
- ga 'file' : git add 'file'
- gt 'tag' 'commit': git tag -a 'tag' -m "commit"
- gm 'commit': git commit -m "commit"
- gam 'commit': git add --all && git commit -m "commit"
- gll: git log (short)
- glla: git log (long)
- grv: git remote -v
- grs: git remote set-url origin url
- gra: git remote add origin url
<!-- ``` -->
