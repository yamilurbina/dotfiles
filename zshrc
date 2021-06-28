if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
source ~/.asdf/plugins/java/set-java-home.zsh

zplug "dracula/zsh", as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug load

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"
export AWS_VAULT_BACKEND=file
export GPG_TTY=$(tty)
export DOCKER_BUILDKIT=1
. $(brew --prefix asdf)/asdf.sh
