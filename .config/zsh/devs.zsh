# ============================================================================
# SHELL TOOLS
# ============================================================================
eval "$(zoxide init --cmd cd zsh)"
command -v thefuck >/dev/null 2>&1 && eval "$(thefuck --alias)"

# ============================================================================
# NODE (NVM)
# ============================================================================
[ -s "$NVM_DIR/nvm.sh" ]          && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# ============================================================================
# SDKMAN (must be last — appends to PATH at runtime)
# ============================================================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ============================================================================
# GHOSTTY
# ============================================================================
if [[ -n "$GHOSTTY_RESOURCES_DIR" ]]; then
    source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
elif [[ -f "/usr/share/ghostty/shell-integration/zsh/ghostty-integration" ]]; then
    source "/usr/share/ghostty/shell-integration/zsh/ghostty-integration"
fi

# ============================================================================
# JETBRAINS
# ============================================================================
[[ -f "${HOME}/.jetbrains.vmoptions.sh" ]] && source "${HOME}/.jetbrains.vmoptions.sh"

# ============================================================================
# CARGO / RUST
# ============================================================================
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# ============================================================================
# SSH AGENT
# ============================================================================
[[ -z "$SSH_AUTH_SOCK" ]] && eval "$(ssh-agent -s)" >/dev/null
