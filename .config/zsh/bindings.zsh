# =========================================================
# zsh-vi-mode — must be sourced before OMZ loads the plugin
# =========================================================

function zvm_config() {
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
}

# zsh-vi-mode resets ALL keymaps on init; fzf, tv, and history-substring-search
# bindings must be re-applied inside this hook.
function zvm_after_init() {
  eval "$(fzf --zsh)"
  command -v tv >/dev/null 2>&1 && eval "$(tv init zsh)"

  bindkey '^p' history-substring-search-backward
  bindkey '^n' history-substring-search-forward
  bindkey '^f' autosuggest-accept
}

zle -N edit-command-line
bindkey '^x^e' edit-command-line

bindkey ' ' magic-space

bindkey -s '^Xgc' 'git commit -m ""\C-b'
bindkey -s '^Xgp' 'git push origin '
bindkey -s '^Xgs' 'git status -s\n'
bindkey -s '^Xgl' 'git log --oneline -n 10\n'
bindkey -s '^Xga' 'git add '
bindkey -s '^O' 'nvim\n'
