#!/bin/bash

# author: Mr.Jor
# version: 1.0
# description: dzs(depth for zimfw shell) 程序的安装脚本


# 判断 zsh 是否为默认 shell
if [[ ! "$SHELL" == */zsh* ]]; then
    echo "zsh is not default shell, please change it first"
    echo "you can use 'chsh -s $(which zsh)' to change it"
    exit 1
fi

# 判断是否存在 .zshrc 文件
if [[ ! -f ~/.zshrc ]]; then
    echo "start create .zshrc file..."
    touch ~/.zshrc
    if [[ $? -ne 0 ]]; then
        echo "create .zshrc file failed"
        exit 1
    else
        echo "create .zshrc file success"
    fi
fi

# 安装 zimfw
echo "
zstyle ':zim:zmodule' use 'degit'

ZIM_HOME=~/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e \${ZIM_HOME}/zimfw.zsh ]]; then
  if (( \${+commands[curl]} )); then
    curl -fsSL --create-dirs -o \${ZIM_HOME}/zimfw.zsh \\
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p \${ZIM_HOME} && wget -nv -O \${ZIM_HOME}/zimfw.zsh \\
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# Install missing modules, and update \${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! \${ZIM_HOME}/init.zsh -nt \${ZDOTDIR:-\${HOME}}/.zimrc ]]; then
  source \${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source \${ZIM_HOME}/init.zsh
" >> ~/.zshrc

# 创建 .zimrc 文件
if [[ ! -f ~/.zimrc ]]; then
    echo "start create .zimrc file..."
    touch ~/.zimrc
    if [[ $? -ne 0 ]]; then
        echo "create .zimrc file failed"
        exit 1
    else
        echo "create .zimrc file success"
    fi
fi

# 初始化 .zimrc 文件
echo "
zmodule asciiship
zmodule zsh-users/zsh-completions --fpath src
zmodule completion
zmodule Aloxaf/fzf-tab
zmodule zsh-users/zsh-syntax-highlighting
zmodule zsh-users/zsh-history-substring-search
zmodule zsh-users/zsh-autosuggestions
zmodule skywind3000/z.lua --cmd 'eval \"\$(lua {}/z.lua --init zsh enhanced once)\"'
zmodule romkatv/powerlevel10k --use degit
" >> ~/.zimrc

# 加载 init.zsh 文件
echo "
[[ -f ~/.config/dzs/init.zsh ]] && source ~/.config/dzs/init.zsh
" >> ~/.zshrc

