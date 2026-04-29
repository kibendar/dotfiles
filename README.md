# dotfiles

Personal development environment managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
sudo pacman -S (or other package manager) git stow
git clone https://github.com/dunkan/.dotfiles ~/.dotfiles
cd ~/.dotfiles
stow .
```

> **Note:** Install all required tools before running `stow .` command. See the sections below for per-tool dependencies.

---

## Overview

| Tool                               | Purpose              | Theme            |
| ---------------------------------- | -------------------- | ---------------- |
| [Neovim](#-neovim)                 | Editor               | Catppuccin Mocha |
| [Zsh](#-zsh)                       | Shell                | —                |
| [Tmux](#-tmux)                     | Terminal multiplexer | Kanagawa         |
| [Ghostty](#-ghostty)               | Terminal emulator    | Noctalia         |
| [Lazygit](#-lazygit)               | Git TUI              | Catppuccin Mocha |
| [btop](#-btop)                     | System monitor       | Noctalia         |
| [fastfetch](#-fastfetch)           | System info          | —                |
| [mpv](#-mpv)                       | Media player         | —                |
| [Niri](#-niri)                     | Wayland compositor   | Kanagawa         |
| [Noctalia Shell](#-noctalia-shell) | Desktop shell        | Noctalia         |

---

## Neovim

Built on top of [LazyVim](https://www.lazyvim.org/) with heavily customized plugins.

<details>
<summary><strong>Plugin highlights</strong></summary>

### Theme & UI

| Plugin            | Description                                         |
| ----------------- | --------------------------------------------------- |
| `catppuccin`      | Primary colorscheme (Mocha)                         |
| `base16-nvim`     | Base16 colorscheme engine with `matugen` integration |
| `lualine.nvim`    | Status line                                         |
| `bufferline.nvim` | Buffer tabs                                         |
| `neo-tree.nvim`   | File explorer                                       |
| `snacks.nvim`     | Collection of small QoL utilities                   |

### LSP & Completion

| Plugin            | Description                     |
| ----------------- | ------------------------------- |
| `nvim-lspconfig`  | Language server configurations  |
| `mason.nvim`      | LSP/linter/formatter installer  |
| `blink.cmp`       | Completion engine               |
| `nvim-treesitter` | Syntax parsing and highlighting |

### Language-Specific

| Plugin                   | Language |
| ------------------------ | -------- |
| `clangd_extensions.nvim` | C / C++  |
| `rustaceanvim`           | Rust     |
| `nvim-jdtls`             | Java     |
| `vimtex`                 | LaTeX    |
| `typst-preview.nvim`     | Typst    |
| `cmake-tools.nvim`       | CMake    |

### Debugging & Testing

| Plugin                             | Description            |
| ---------------------------------- | ---------------------- |
| `nvim-dap` + `nvim-dap-ui`         | Debug Adapter Protocol |
| `neotest`                          | Test runner framework  |
| `neotest-python` / `neotest-rspec` | Language adapters      |

### Navigation & Editing

| Plugin                      | Description               |
| --------------------------- | ------------------------- |
| `harpoon`                   | Quick file marks          |
| `leap.nvim`                 | Fast 2-char motion        |
| `flash.nvim`                | Enhanced search/jump      |
| `mini.ai` / `mini.surround` | Extended text objects     |
| `yanky.nvim`                | Yank history              |
| `dial.nvim`                 | Smart increment/decrement |
| `inc-rename.nvim`           | Interactive LSP renaming  |
| `refactoring.nvim`          | Code refactoring tools    |

### Git & GitHub

| Plugin          | Description                 |
| --------------- | --------------------------- |
| `gitsigns.nvim` | Inline diff signs           |
| `octo.nvim`     | GitHub Issues & PRs         |
| `gh.nvim`       | GitHub CLI wrapper          |
| `grug-far.nvim` | Project-wide find & replace |

### Productivity

| Plugin               | Description           |
| -------------------- | --------------------- |
| `kulala.nvim`        | REST API client       |
| `vim-dadbod` + UI    | Database client       |
| `trouble.nvim`       | Diagnostics list      |
| `todo-comments.nvim` | TODO/FIXME highlights |
| `which-key.nvim`     | Keybinding hints      |
| `persistence.nvim`   | Session management    |
| `claude-code.nvim`   | Claude AI integration |

</details>

<details>
<summary><strong>Key bindings</strong></summary>

| Keys          | Mode   | Action                             |
| ------------- | ------ | ---------------------------------- |
| `Alt+h/j/k/l` | Normal | Navigate tmux/nvim panes           |
| `Ctrl+d/u`    | Normal | Scroll half-page (cursor centered) |
| `U`           | Normal | Redo                               |
| `Ctrl+c`      | Insert | Escape                             |
| `x`           | Visual | Command mode                       |

</details>

---

## Zsh

Oh My Zsh with a curated plugin set and [Starship](https://starship.rs/) prompt.

<details>
<summary><strong>Plugins</strong></summary>

| Plugin                         | Description                     |
| ------------------------------ | ------------------------------- |
| `zsh-vi-mode`                  | Vi keybindings in the shell     |
| `zsh-autosuggestions`          | Fish-like inline suggestions    |
| `zsh-syntax-highlighting`      | Command syntax coloring         |
| `zsh-history-substring-search` | History search with up/down     |
| `fzf-tab`                      | Replace tab-completion with fzf |
| `git`                          | Git aliases                     |
| `docker`                       | Docker aliases & completion     |
| `thefuck`                      | Auto-correct mistyped commands  |

</details>

<details>
<summary><strong>Aliases & tool replacements</strong></summary>

| Alias | Expands to           | Tool                                                |
| ----- | -------------------- | --------------------------------------------------- |
| `ls`  | `eza --icons`        | [eza](https://github.com/eza-community/eza)         |
| `ll`  | `eza --tree --icons` | eza                                                 |
| `cat` | `bat`                | [bat](https://github.com/sharkdp/bat)               |
| `v`   | `nvim`               | Neovim                                              |
| `lg`  | `lazygit`            | Lazygit                                             |
| `y`   | `yazi`               | [Yazi](https://github.com/sxyazi/yazi) file manager |
| `ff`  | `fastfetch`          | Fastfetch                                           |
| `p`   | `python3`            | Python                                              |

</details>

<details>
<summary><strong>Key bindings</strong></summary>

| Keys                | Action                            |
| ------------------- | --------------------------------- |
| `Ctrl+f`            | Accept autosuggestion             |
| `Ctrl+p` / `Ctrl+n` | History search backward / forward |
| `jj`                | Escape from vi insert mode        |

</details>

**Version managers included:** NVM, SDKMAN, pipx, Homebrew (linuxbrew).

---

## Tmux

Prefix key changed to `Ctrl+A`. All custom bindings use `Alt` so you never need to press the prefix.

<details>
<summary><strong>Key bindings</strong></summary>

### Panes

| Keys                | Action                              |
| ------------------- | ----------------------------------- |
| `Alt+v`             | Split vertical                      |
| `Alt+s`             | Split horizontal                    |
| `Alt+h/j/k/l`       | Navigate panes (shared with Neovim) |
| `Alt+Shift+H/J/K/L` | Resize pane                         |
| `Alt+x`             | Close pane                          |
| `Alt+z`             | Zoom / unzoom pane                  |
| `Alt+b`             | Break pane to new window            |

### Windows

| Keys              | Action                   |
| ----------------- | ------------------------ |
| `Alt+Enter`       | New window               |
| `Alt+n` / `Alt+p` | Next / previous window   |
| `Alt+<` / `Alt+>` | Move window left / right |

### Sessions

| Keys    | Action               |
| ------- | -------------------- |
| `Alt+w` | Switch session (fzf) |
| `Alt+X` | Kill session         |
| `Alt+d` | Detach               |

### Copy mode

| Keys    | Action          |
| ------- | --------------- |
| `Alt+[` | Enter copy mode |
| `v`     | Begin selection |
| `y`     | Copy selection  |
| `Alt+p` | Paste           |

### Misc

| Keys    | Action            |
| ------- | ----------------- |
| `Alt+r` | Reload config     |
| `Alt+S` | Toggle status bar |
| `Alt+I` | Install plugins   |
| `Alt+U` | Update plugins    |

</details>

<details>
<summary><strong>Plugins</strong></summary>

| Plugin            | Description                      |
| ----------------- | -------------------------------- |
| `tpm`             | Plugin manager                   |
| `tmux-sensible`   | Sensible defaults                |
| `tmux-yank`       | Copy to system clipboard         |
| `tmux-resurrect`  | Save & restore sessions          |
| `tmux-continuum`  | Auto-save sessions every 15 min  |
| `tmux-thumbs`     | Hint-based link/path picking     |
| `tmux-fzf`        | FZF session/window/pane switcher |
| `tmux-fzf-url`    | Pick & open URLs from pane       |
| `tmux-floax`      | Floating scratch window          |
| `tmux-sessionx`   | Enhanced session manager         |
| `catppuccin-tmux` | Statusbar structure; colors overridden with Kanagawa palette |

</details>

---

## Ghostty

GPU-accelerated terminal emulator with a custom cursor shader.

| Setting           | Value                                |
| ----------------- | ------------------------------------ |
| Font              | JetBrainsMono Nerd Font, size 15     |
| Theme             | Noctalia                             |
| Cursor            | Block with `cursor_warp.glsl` shader |
| Window            | Maximized on launch                  |
| Shell integration | Zsh                                  |

Seven cursor shaders are available in `.config/ghostty/shaders/` — swap by changing the `custom-shader` value in `config`.

---

## Lazygit

Catppuccin Mocha colors applied via manually specified hex values in the `gui.theme` block of `config.yml`.

---

## btop

| Setting         | Value                        |
| --------------- | ---------------------------- |
| Theme           | Noctalia                     |
| Graph symbols   | Braille (highest resolution) |
| Update rate     | 2 000 ms                     |
| Vim keybindings | Enabled                      |
| Process sort    | CPU (lazy)                   |

---

## fastfetch

Custom ASCII logo with a module layout showing: OS · Kernel · Packages · Shell · Terminal · WM · CPU · Disk · Memory · Uptime · DateTime.

---

## mpv

Minimal config (fullscreen geometry) with a rich script layer:

| Script      | Description                           |
| ----------- | ------------------------------------- |
| `uosc`      | Full-featured on-screen UI controller |
| `thumbfast` | Seekbar thumbnail previews            |
| `autoload`  | Auto-load files into playlist         |
| `memo`      | Bookmarks & watch history             |
| `autodeint` | Auto-apply deinterlace filter         |

---

## Fonts

JetBrainsMono Nerd Font is used across all tools. Install it from [Nerd Fonts](https://www.nerdfonts.com/).

## Color themes

Three theme families are in use:

- **[Noctalia](https://github.com/noctalia/noctalia-shell)** — Ghostty and btop. The btop theme file (`.config/btop/themes/noctalia.theme`) is generated by the Noctalia project; no manual color definitions required.
- **[Kanagawa](https://github.com/rebelot/kanagawa.nvim)** — Tmux (pane borders, copy mode, message styles, and status module color overrides all use the Kanagawa palette) and Niri window decorations.
- **[Catppuccin Mocha](https://github.com/catppuccin/catppuccin)** — Neovim and Lazygit (hex values from the Catppuccin Mocha palette).
