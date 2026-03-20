# ============================================================================
# ZSH CONFIGURATION
# ============================================================================
# A well-organized Zsh configuration with Oh My Zsh, modern CLI tools,
# and productivity enhancements
# ============================================================================

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Created by `pipx` on 2026-01-01 10:39:32
export PATH="$PATH:/home/dunkan/.local/bin"

export PATH="$PATH:/usr/local/bin"

# ----------------------------------------------------------------------------
# PROMPT INITIALIZATION
# ----------------------------------------------------------------------------
# Using Starship prompt for a modern, fast, and customizable shell prompt
eval "$(starship init zsh)"

# Alternative prompt managers (commented out)
# cbonsai -p
# figlet -c -t -f CalvinS "I use Manjaro, btw" | lolcat
# eval "$(oh-my-posh init zsh)"

# Powerlevel10k instant prompt (disabled in favor of Starship)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ----------------------------------------------------------------------------
# MODERN CLI TOOLS INITIALIZATION
# ----------------------------------------------------------------------------
# FZF - Fuzzy finder for command-line
eval "$(fzf --zsh)"

# Zoxide - Smarter cd command that learns your habits
eval "$(zoxide init --cmd cd zsh)"

# ----------------------------------------------------------------------------
# OH MY ZSH CONFIGURATION
# ----------------------------------------------------------------------------
# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme Configuration
# Using Starship instead of Oh My Zsh themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugin Configuration
# Carefully selected plugins for enhanced functionality
plugins=(
    git                          # Git aliases and functions
    z                           # Jump to frequently used directories
    zsh-vi-mode                 # Vi mode in command line
    zsh-history-substring-search # Search through command history
    zsh-syntax-highlighting     # Syntax highlighting for commands
    zsh-autosuggestions        # Fish-like autosuggestions
    docker                      # Docker completion and aliases
    fzf                        # FZF integration
    fzf-tab                    # Replace default completion with fzf
    thefuck                    # Corrects previous console command
    history                    # History management
)

# ----------------------------------------------------------------------------
# KEY BINDINGS
# ----------------------------------------------------------------------------
# Accept autosuggestion
bindkey '^f' autosuggest-accept

# History search
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Vi mode configuration
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# ----------------------------------------------------------------------------
# HISTORY CONFIGURATION
# ----------------------------------------------------------------------------
# Extensive history with duplicate management
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# History options
setopt appendhistory           # Append to history file
setopt sharehistory           # Share history between sessions
setopt hist_ignore_space      # Ignore commands starting with space
setopt hist_ignore_all_dups   # Remove all duplicates
setopt hist_save_no_dups      # Don't save duplicates
setopt hist_ignore_dups       # Don't record duplicates
setopt hist_find_no_dups      # Don't display duplicates in search

# ----------------------------------------------------------------------------
# COMPLETION STYLING
# ----------------------------------------------------------------------------
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Disable default menu for fzf-tab
zstyle ':completion:*' menu no

# FZF tab preview with eza
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --level=1 --icons=always --no-time --no-user --no-permissions $realpath'

# ----------------------------------------------------------------------------
# COMPLETION SYSTEM
# ----------------------------------------------------------------------------
# Add custom completions path
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Initialize completion system
autoload -U compinit && compinit

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

eval $(thefuck --alias)

# Java completion
compdef _files java

# ----------------------------------------------------------------------------
# BUN COMPLETIONS
# ----------------------------------------------------------------------------
[ -s "/Users/alaricode/.bun/_bun" ] && source "/Users/alaricode/.bun/_bun"

# ----------------------------------------------------------------------------
# ALIASES - FILE MANAGEMENT
# ----------------------------------------------------------------------------
# Modern alternatives to classic commands
alias ls="eza --icons=always --no-time --no-user --no-permissions"
alias ll="eza --tree --level=1 -la"
alias cat="bat"

# ----------------------------------------------------------------------------
# ALIASES - EDITORS
# ----------------------------------------------------------------------------
 
# Default Neovim
CONFIG_DIR="$HOME/.config"
alias v='nvim'

# ----------------------------------------------------------------------------
# ALIASES - DEVELOPMENT TOOLS
# ----------------------------------------------------------------------------
# Git
alias g="git"
alias lg="lazygit"

# File manager
alias y="yazi"

# System info
alias ff="fastfetch"

# Docker
alias d="sudo docker"
alias dcu='sudo docker-compose up'
alias dcd='sudo docker-compose down'

# Python
alias p="python3"
alias pi="python3 install"
alias pu="python3 uninstall"

# Mermaid
alias mmdc='PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium mmdc'

# ----------------------------------------------------------------------------
# ALIASES - TMUX
# ----------------------------------------------------------------------------
alias t='tmux'
alias ts='tmux new -s'
alias tl='tmux ls'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'

# ----------------------------------------------------------------------------
# ALIASES - TMUX
# ----------------------------------------------------------------------------

alias refl='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

# ----------------------------------------------------------------------------
# ALIASES - CUSTOM SCRIPTS
# ----------------------------------------------------------------------------
alias cli_ex="~/venv/bin/cliexercises"

# ----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES - EDITOR
# ----------------------------------------------------------------------------
export EDITOR=nvim
export VISUAL=$EDITOR

# ----------------------------------------------------------------------------
# ENVIRONMENT VARIABLES - LOCALE & BROWSER
# ----------------------------------------------------------------------------
export LC_TIME=en_US.UTF-8
BROWSER=/usr/bin/firefox

# ----------------------------------------------------------------------------
# NODE VERSION MANAGER (NVM)
# ----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----------------------------------------------------------------------------
# SDKMAN (Software Development Kit Manager)
# ----------------------------------------------------------------------------
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ----------------------------------------------------------------------------
# ADDITIONAL INTEGRATIONS
# ----------------------------------------------------------------------------
# Ghostty terminal shell integration
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
    source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
elif [[ -f "/usr/share/ghostty/shell-integration/zsh/ghostty-integration" ]]; then
    source "/usr/share/ghostty/shell-integration/zsh/ghostty-integration"
fi

# Custom environment file
. "$HOME/.local/share/../bin/env"

# JetBrains VM options
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"
if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then
    . "${___MY_VMOPTIONS_SHELL_FILE}"
fi


# GPG TTY configuration
export GPG_TTY=$(tty)

# ============================================================================
# END OF CONFIGURATION
# ============================================================================
