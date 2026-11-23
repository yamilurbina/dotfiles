# -----------------------------------------------------------------------------
# Zinit (installed via Homebrew, which must already be on PATH)
# -----------------------------------------------------------------------------
brew_prefix=$(brew --prefix)
source "$brew_prefix/opt/zinit/zinit.zsh"

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_ignore_space

# -----------------------------------------------------------------------------
# Plugins that must load before compinit
# -----------------------------------------------------------------------------
zinit light zsh-users/zsh-completions
zinit snippet OMZP::git

# Completion system
autoload -Uz compinit && compinit
zinit cdreplay -q

# fzf-tab must load after compinit, but before widget-wrapping plugins
zinit light Aloxaf/fzf-tab
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# -----------------------------------------------------------------------------
# Plugins
# -----------------------------------------------------------------------------
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light MichaelAquilina/zsh-you-should-use
zinit light hlissner/zsh-autopair
zinit light zdharma-continuum/fast-syntax-highlighting

# -----------------------------------------------------------------------------
# Tool integrations
# -----------------------------------------------------------------------------
# fzf key bindings: Ctrl+T (files), Ctrl+R (history), Alt+C (cd).
# We deliberately skip fzf's completion.zsh, which binds Tab, so fzf-tab owns Tab.
# fzf 0.75's script tries to restore the read-only `zle` option on macOS zsh 5.9;
# that warning is harmless, so silence it here.
source "$brew_prefix/opt/fzf/shell/key-bindings.zsh" 2>/dev/null

# zoxide: z <pattern> for smart directory jumping
eval "$(zoxide init zsh)"

# mise: activate tools pinned in mise.toml (e.g. terraform) for each directory
eval "$(mise activate zsh)"

# -----------------------------------------------------------------------------
# Dracula prompt theme (loaded last so it can wrap zle widgets)
# -----------------------------------------------------------------------------
zinit ice pick"dracula.zsh-theme"
zinit light dracula/zsh

# -----------------------------------------------------------------------------
# Tool aliases (eza / fzf / fd / bat)
# -----------------------------------------------------------------------------
# eza
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

# fzf + fd + bat
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
eff() { local f; f=$(ff) && [[ -n $f ]] && ${EDITOR:-nvim} "$f"; }
sff() {
  local f
  f=$(fd -t f . | fzf) || return
  [[ -n $f ]] && scp "$f" "${1:?usage: sff host:/path/}"
}

# bat in place of cat
alias cat='bat --paging=never --style=plain'

# nvim: no args opens the current directory, otherwise pass through
n() {
  if (( $# == 0 )); then command nvim .
  else command nvim "$@"
  fi
}
