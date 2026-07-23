# ============================================================================
# OH MY ZSH
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"

# zsh-vi-mode: must be set before the plugin is loaded by OMZ
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# Modules sourced before OMZ:
#   plugins.zsh  — defines plugins=() array and fpath consumed by OMZ
#   fzf.zsh      — sets FZF_* env vars
#   bindings.zsh — defines zvm_config and zvm_after_init hooks
source "${ZDOTDIR}/plugins.zsh"
source "${ZDOTDIR}/fzf.zsh"
source "${ZDOTDIR}/bindings.zsh"
source "${ZDOTDIR}/widgets.zsh"

source "$ZSH/oh-my-zsh.sh"

# ============================================================================
# HISTORY
# ============================================================================
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ============================================================================
# COMPLETION
# ============================================================================
fpath=(~/ $fpath)

autoload -Uz compinit
compinit
autoload -Uz edit-command-line
autoload -Uz add-zsh-hook
autoload -Uz zmv

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview \
    'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview \
    'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'

compdef _files java

# ============================================================================
# MODULES (post-OMZ)
# ============================================================================
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/devs.zsh"
source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/chpwd.zsh"
[[ -f "${ZDOTDIR}/secrets.zsh" ]] && source "${ZDOTDIR}/secrets.zsh"
