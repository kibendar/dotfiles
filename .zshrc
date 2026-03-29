# ============================================================================
# ZSH CONFIGURATION
# ============================================================================

# ----------------------------------------------------------------------------
# PATH & CORE ENVIRONMENT
# ----------------------------------------------------------------------------
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:/home/dunkan/.local/bin:/usr/local/bin"

export EDITOR=nvim
export VISUAL=$EDITOR
export BROWSER=/usr/bin/firefox
export LC_TIME=en_US.UTF-8
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"
CONFIG_DIR="$HOME/.config"

# ----------------------------------------------------------------------------
# HISTORY
# ----------------------------------------------------------------------------
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups \
       hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ----------------------------------------------------------------------------
# OH MY ZSH
# ----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# zsh-vi-mode must be configured BEFORE sourcing OMZ
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

function zvm_config() {
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

# Plugin load order matters:
#   zsh-syntax-highlighting must come before zsh-history-substring-search
#   fzf-tab must be loaded after compinit (OMZ handles this)
#   fzf and thefuck are initialized via eval below — NOT as plugins
plugins=(
    git
    zsh-vi-mode
    zsh-autosuggestions
    docker
    fzf-tab
    history
    zsh-syntax-highlighting
    zsh-history-substring-search
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source "$ZSH/oh-my-zsh.sh"

# ----------------------------------------------------------------------------
# COMPLETION STYLING  (after compinit, which OMZ runs automatically)
# ----------------------------------------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview \
    'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview \
    'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'

# ----------------------------------------------------------------------------
# ZVM_AFTER_INIT — restore bindings that zsh-vi-mode overwrites
# ----------------------------------------------------------------------------
# zsh-vi-mode resets ALL keymaps on init. FZF, Television, and history-
# substring-search bindings must be re-applied inside this hook.
function zvm_after_init() {
  # FZF: ctrl-t (files), ctrl-r (history), alt-c (dirs)
  eval "$(fzf --zsh)"

  # Television: ctrl-t (smart autocomplete), ctrl-r (history) — overrides fzf's
  eval "$(tv init zsh)"

  # History substring search
  bindkey '^p' history-substring-search-backward
  bindkey '^n' history-substring-search-forward

  # Autosuggestion accept
  bindkey '^f' autosuggest-accept
}

# ----------------------------------------------------------------------------
# TOOL INITIALIZATION
# ----------------------------------------------------------------------------
# Zoxide — smarter cd (provides z, zi, and overrides cd)
eval "$(zoxide init --cmd cd zsh)"

# Thefuck — command corrector
eval "$(thefuck --alias)"

# Starship — prompt (last, so nothing overwrites it)
eval "$(starship init zsh)"

# Java completion
compdef _files java

# ----------------------------------------------------------------------------
# RUNTIME INTEGRATIONS
# ----------------------------------------------------------------------------
# NVM
[ -s "$NVM_DIR/nvm.sh" ]           && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ]  && source "$NVM_DIR/bash_completion"

# SDKMAN (must stay near end of file per sdkman docs)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Ghostty terminal shell integration
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
    source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
elif [[ -f "/usr/share/ghostty/shell-integration/zsh/ghostty-integration" ]]; then
    source "/usr/share/ghostty/shell-integration/zsh/ghostty-integration"
fi

# JetBrains VM options
[[ -f "${HOME}/.jetbrains.vmoptions.sh" ]] && source "${HOME}/.jetbrains.vmoptions.sh"

# Cargo/Rust environment
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# ----------------------------------------------------------------------------
# ALIASES — FILE MANAGEMENT
# ----------------------------------------------------------------------------
alias ls="eza --icons=always --no-time --no-user --no-permissions"
alias ll="eza --tree --level=1 -la"
alias cat="bat"

# ----------------------------------------------------------------------------
# ALIASES — EDITORS & NAVIGATION
# ----------------------------------------------------------------------------
alias v='nvim'
alias y="yazi"
alias ff="fastfetch"

# ----------------------------------------------------------------------------
# ALIASES — GIT
# ----------------------------------------------------------------------------
alias g="git"
alias lg="lazygit"

# ----------------------------------------------------------------------------
# ALIASES — DOCKER
# ----------------------------------------------------------------------------
alias d="sudo docker"
alias dcu='sudo docker-compose up'
alias dcd='sudo docker-compose down'

# ----------------------------------------------------------------------------
# ALIASES — TELEVISION
# ----------------------------------------------------------------------------
alias tvc="tv channels"

# ----------------------------------------------------------------------------
# ALIASES — PYTHON
# ----------------------------------------------------------------------------
alias p="python3"
alias pi="python3 install"
alias pu="python3 uninstall"

# ----------------------------------------------------------------------------
# ALIASES — TMUX
# ----------------------------------------------------------------------------
alias t='tmux'
alias ts='tmux new -s'
alias tl='tmux ls'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'

# ----------------------------------------------------------------------------
# ALIASES — CLAUDE
# ----------------------------------------------------------------------------

alias cc="claude --continue"

# ----------------------------------------------------------------------------
# ALIASES — SYSTEM
# ----------------------------------------------------------------------------
alias mmdc='PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium mmdc'
alias refl='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias cli_ex="~/venv/bin/cliexercises"

# ============================================================================
# END OF CONFIGURATION
# ============================================================================
