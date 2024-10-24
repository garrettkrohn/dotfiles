# Path to your oh-my-zsh installation.

export ZSH="$HOME/.oh-my-zsh"

export EDITOR='nvim'

ZSH_THEME=""

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-vi-mode)

# user config

# sources zsh file
source $ZSH/oh-my-zsh.sh

# sources the alias file
source $HOME/dotfiles/config/aliases

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ~/.tmux/plugins
export PATH="$PATH:$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin"

# Star Ship
eval "$(starship init zsh)"

# zoxide init
eval "$(zoxide init zsh)"

# fnm
export PATH="$PATH:$HOME/.fnm"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# go
export PATH=$PATH:$(go env GOPATH)/bin

# code to have multiple configs
# alias kick="NVIM_APPNAME=kickstart nvim"
#
# function nvims() {
#   items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=$config nvim $@
# }

now() {
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$timestamp" | xclip -selection clipboard
    echo "Timestamp copied to clipboard: $timestamp"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="$PATH:/opt/homebrew/opt/openjdk/bin"
export PATH="$PATH:/usr/local/opt/python/libexec/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# open nvim directly into telescope
function fuzzy_nvim_start {
    if [ "$#" -eq 0 ]; then
        kick +'Telescope find_files hidden=false layout_config={height=0.9}'
    elif [ -d "$1" ]; then
        kick +"Telescope find_files hidden=false layout_config={height=0.9} cwd=$1"
    else
        kick $@
    fi
}

export PATH="$PATH:/opt/homebrew/opt/postgresql@15/bin"
export PATH="$PATH:$HOME/dotfiles/config/scripts"
export GH_DASH_CONFIG="$HOME/.config/gh-dash/config.yml"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/opt/homebrew/bin"

# Debugging statements
# echo "Final PATH:"
# Echo $PATH | tr ':' '\n'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Node.js paths
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v16.0.0/bin:$PATH"

# Python paths
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Go paths
export PATH="$HOME/go/bin:$PATH"

# Custom application paths
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/Users/gkrohn/.pyenv/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/gkrohn/.pyenv/shims:$PATH"
export PATH="/Users/gkrohn/Library/Caches/fnm_multishells/4356_1726235403350/bin:$PATH"
export PATH="$HOME/dotfiles/config/scripts:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/gkrohn/Library/Caches/fnm_multishells/5556_1726235576088/bin:$PATH"
export PATH="/Users/gkrohn/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/System/Cryptexes/App/usr/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:$PATH"
export PATH="/Users/gkrohn/Library/Caches/fnm_multishells/66978_1726581958252/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/gkrohn/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/Users/gkrohn/Library/Caches/fnm_multishells/4707_1726502124921/bin:$PATH"
export PATH="/Users/gkrohn/.fnm:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/Users/gkrohn/go/bin:$PATH"
export PATH="/Users/gkrohn/Library/Caches/fnm_multishells/4903_1726502128152/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:$PATH"
