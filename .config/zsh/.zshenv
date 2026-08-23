# =========================================================
# XDG base directories
# =========================================================
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# =========================================================
# Editor / pager
# =========================================================
export EDITOR="nvim"
export VISUAL="nvim"

if command -v bat >/dev/null 2>&1; then
    export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
    export MANPAGER="batcat -l man -p"
fi

# =========================================================
# Terminal / prompt
# =========================================================
export GPG_TTY=$(tty)
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# =========================================================
# PATH
# =========================================================
# pnpm is installed via pacman, so `pnpm setup` can't run (it would try to
# write /usr/bin/package.json). Wire it up by hand instead. Note: as of
# pnpm 11 the global bin dir is $PNPM_HOME/bin, not $PNPM_HOME itself.
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export PATH="/usr/local/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.opencode/bin:$HOME/.npm-global/bin/:$PNPM_HOME/bin:$PATH"
