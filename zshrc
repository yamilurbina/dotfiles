if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'dracula/zsh', as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug load

export GPG_TTY=$(tty)
. $(brew --prefix asdf)/asdf.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# set lang
export LANG=en_US.UTF-8
