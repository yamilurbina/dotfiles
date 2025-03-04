export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

PS1='%~ '
precmd() { print -Pn "\e]0;%~\a" }

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugin
zinit light dracula/zsh
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/history-search-multi-word
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# Dracula
DRACULA_DISPLAY_FULL_CWD=1
DRACULA_DISPLAY_NEW_LINE=1

# History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000
setopt inc_append_history

# Mise
eval "$(mise activate zsh)"

# Fuzzy Finder
eval "$(fzf --zsh)"

# Aliases
alias ls='eza -lh --group-directories-first --icons=auto'

# Zellij
eval "$(zellij setup --generate-auto-start zsh)"

# 1Password
[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh
