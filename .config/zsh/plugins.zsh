# OMZ plugin list — loaded by oh-my-zsh.sh in .zshrc
# Rules: fzf-tab must be first, zsh-syntax-highlighting must be last
plugins=(
    fzf-tab
    git
    pass
    docker
    docker-compose
    npm
    kubectl
    aws
    web-search
    thefuck
    virtualenv
    history
    aliases
    zsh-vi-mode
    zsh-autosuggestions
    zsh-history-substring-search
    fast-syntax-highlighting
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
