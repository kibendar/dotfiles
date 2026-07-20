# =========================================================
# Yazi — cd on exit
# =========================================================
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# =========================================================
# File system
# =========================================================
alias ls="eza --icons=always --no-time --no-user --no-permissions"
alias ll="eza --tree --level=1 -la"
alias la='eza -lah --icons --git'
alias tree='eza --tree --icons'
compdef eza=ls

alias cat="bat"
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias -- -='cd -'

# =========================================================
# Editor
# =========================================================
alias v='nvim'
alias vim='nvim'
alias ff="fastfetch"
alias brf='brrtfetch ~/Gifs/arch.gif -info "fastfetch --config ~/.config/brrtfetch/config_brf.jsonc" -width 20 -fps 17'

# =========================================================
# Git
# =========================================================
alias g="git"
alias lg="lazygit"
alias glog='PAGER="less -F -X" git log'
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gcamend='git commit --amend -m'

# =========================================================
# Docker
# =========================================================
alias d="sudo docker"
alias dcu='sudo docker-compose up'
alias dcd='sudo docker-compose down'

# =========================================================
# Television
# =========================================================
alias tvc="tv channels"

# =========================================================
# Python
# =========================================================
alias python='python3'
alias p="python3"

# =========================================================
# Tmux
# =========================================================
alias t='tmux'
alias ts='tmux new -s'
alias tl='tmux ls'
alias ta='tmux attach-session -t'
alias tk='tmux kill-session -t'

# =========================================================
# Timeshift
# =========================================================
alias tsl="sudo timeshift --list"
alias tsd="sudo timeshift --delete --snapshot"
alias tsc="sudo timeshift --create"

# =========================================================
# Claude
# =========================================================
alias c="claude"
alias cc="claude --continue"

# =========================================================
# System
# =========================================================
alias mmdc='PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium mmdc'
alias refl='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias cli_ex="~/venv/bin/cliexercises"
alias unfuck_wifi="sudo systemctl restart iwd"
alias hub_log_1='minicom -o -D /dev/ttyUSB0'
alias hub_log_2='minicom -o -D /dev/ttyUSB1'
alias rzsh="exec zsh"
alias rkanata="sudo systemctl restart kanata.service"

# =========================================================
# Shell utilities
# =========================================================
alias h2d='printf "%d\n" 0x'
alias d2h='printf "%x\n"'
alias d2H='printf "%X\n"'
