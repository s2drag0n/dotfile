if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`
POWERLEVEL9K_MODE="awesome-patched"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions extract z web-search)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH=/Users/2drag0ns/.local/bin:$PATH
source ~/.bash_profile

export GO111MODULE=on
export GOPROXY=https://goproxy.cn

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'

alias v='nvim'
alias n='neofetch'

export YAZI_CONFIG_HOME=~/.config/yazi/

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.

# yazi使用ya进入，并提供退出yazi时切换工作目录的能力
function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# better ls
alias ls='lsd'

export NVIM_PATH=~/nvim-macos-arm64/bin
export PATH=$NVIM_PATH:$PATH
