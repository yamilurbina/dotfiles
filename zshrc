if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "dracula/zsh", as:theme

zplug load

export GPG_TTY=$(tty)
. $(brew --prefix asdf)/asdf.sh

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# set lang
export LANG=en_US.UTF-8

export CLOUDSDK_PYTHON="/usr/local/opt/python@3.8/libexec/bin/python"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
export PATH="/usr/local/sbin:$PATH"

export ANDROID_HOME="/usr/local/share/android-sdk"
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$HOME/.arkade/bin/
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
