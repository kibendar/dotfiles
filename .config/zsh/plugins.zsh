# OMZ plugin list — loaded by oh-my-zsh.sh in .zshrc
# Rules: fzf-tab must be first, zsh-syntax-highlighting must be last
plugins=(
    git
    pass
    docker
    history
    fzf-tab
    zsh-vi-mode
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

zplugin-update() {
    local dir
    for dir in "${ZSH_CUSTOM:-$ZSH/custom}/plugins"/*/; do
        [[ -d "$dir/.git" ]] || continue
        echo "Updating ${dir:t}..."
        git -C "$dir" pull --ff-only
    done
}
