# dotfiles

Personal development environment managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
sudo pacman -S git stow
git clone https://github.com/dunkan/.dotfiles ~/.dotfiles
cd ~/.dotfiles
stow .
```

> **Note:** Install all required tools before running `stow .`. See the per-tool sections below for dependencies.

---

## Overview

| Tool                               | Purpose                    | Theme            |
| ---------------------------------- | -------------------------- | ---------------- |
| [Niri](#-niri)                     | Wayland compositor         | Kanagawa         |
| [Noctalia Shell](#-noctalia-shell) | Desktop shell              | Noctalia         |
| [Ghostty](#-ghostty)               | Terminal emulator          | Noctalia         |
| [Tmux](#-tmux)                     | Terminal multiplexer       | Kanagawa         |
| [Zsh](#-zsh)                       | Shell                      | —                |
| [Neovim](#-neovim)                 | Editor                     | Catppuccin Mocha |
| [Lazygit](#-lazygit)               | Git TUI                    | Catppuccin Mocha |
| [btop](#-btop)                     | System monitor             | Noctalia         |
| [mpv](#-mpv)                       | Media player               | Catppuccin Mocha |
| [fastfetch](#-fastfetch)           | System info                | —                |
| [brrtfetch](#-brrtfetch)           | Animated system info       | —                |
| [gowall](#-gowall)                 | Wallpaper recolor          | Kanagawa Paper   |

---

## Niri

[Niri](https://github.com/YaLTeR/niri) is a scrollable-tiling Wayland compositor. Config is split into focused KDL files under `.config/niri/`.

**Named workspaces:** `development` (1) · `browser` (2) · `media` (3) · `utility` (4)

Window rules auto-route apps by `app-id`: terminals and editors → development, browsers → browser, messengers → media, utilities → utility. All windows open maximized with 8 px rounded corners.

<details>
<summary><strong>Layout & visuals</strong></summary>

| Setting          | Value                                         |
| ---------------- | --------------------------------------------- |
| Gaps             | 8 px                                          |
| Default width    | 50 % of workspace                             |
| Preset widths    | 33 % / 50 % / 66 %                            |
| Focus ring       | Active gradient `#98BB6C → #7AA89F` at 45°    |
| Shadow           | Enabled, softness 30, spread 5, offset Y +5   |
| Corner radius    | 8 px                                          |
| Animations       | Spring physics (workspace/movement), ease-out-expo (open/close) |

</details>

<details>
<summary><strong>Input</strong></summary>

| Setting              | Value                              |
| -------------------- | ---------------------------------- |
| Keyboard layouts     | `us`, `ru`, `ua` — toggle `Win+Space` |
| Key repeat           | Rate 35, delay 200 ms              |
| Touchpad             | Tap, DWT, natural scroll           |
| Focus follows mouse  | Yes (0 % scroll amount)            |
| Mouse warp           | On focus change                    |

</details>

<details>
<summary><strong>Key bindings</strong></summary>

### Apps

| Keys               | Action                        |
| ------------------ | ----------------------------- |
| `Mod+Return`       | Launch / focus Ghostty+Tmux   |
| `Mod+B`            | Launch / focus Zen browser    |
| `Mod+T`            | Launch / focus Telegram       |
| `Mod+D`            | Launch / focus Discord        |
| `Mod+Alt+F`        | Launch Yazi in Ghostty        |
| `Mod+Alt+K`        | Launch KeePassXC              |
| `Mod+Alt+D`        | Launch LocalSend              |
| `Mod+Alt+C`        | Open Niri config dir in Nvim  |

### Focus & movement

| Keys                        | Action                       |
| --------------------------- | ---------------------------- |
| `Mod+H/J/K/L`               | Focus column / workspace     |
| `Mod+Ctrl+H/J/K/L`          | Move column / to workspace   |
| `Mod+Shift+H/J/K/L`         | Focus monitor                |
| `Mod+Shift+Ctrl+H/J/K/L`    | Move column to monitor       |
| `Mod+1–9`                   | Focus workspace              |
| `Mod+Shift+1–4`             | Move column to named workspace |

### Window manipulation

| Keys              | Action                            |
| ----------------- | --------------------------------- |
| `Mod+Q`           | Close window                      |
| `Mod+V`           | Toggle floating                   |
| `Mod+W`           | Toggle tabbed column              |
| `Mod+F`           | Maximize column                   |
| `Mod+Shift+F`     | Fullscreen window                 |
| `Mod+C`           | Center column                     |
| `Mod+R`           | Cycle preset column widths        |
| `Mod+- / Mod+=`   | Shrink / grow column width        |
| `Mod+,`           | Consume window into column        |
| `Mod+.`           | Expel window from column          |
| `Mod+O`           | Toggle overview                   |

### Screenshots

| Keys           | Action             |
| -------------- | ------------------ |
| `Mod+Shift+S`  | Region screenshot  |
| `Mod+Ctrl+S`   | Full screen        |
| `Mod+Alt+S`    | Window screenshot  |

### Media & system

| Keys                       | Action               |
| -------------------------- | -------------------- |
| `XF86AudioRaiseVolume`     | Volume +10 %         |
| `XF86AudioLowerVolume`     | Volume −10 %         |
| `XF86AudioMute`            | Toggle mute          |
| `XF86AudioMicMute`         | Toggle mic mute      |
| `XF86AudioPlay`            | Play / pause         |
| `XF86AudioPrev/Next`       | Previous / next      |
| `XF86MonBrightnessUp/Down` | Brightness ±10 %     |
| `Mod+Shift+E`              | Quit Niri            |
| `Mod+Shift+P`              | Power off monitors   |

</details>

---

## Noctalia Shell

[Noctalia Shell](https://github.com/noctalia/noctalia-shell) is a [Quickshell](https://quickshell.outfoxxed.me/)-based desktop shell launched at startup via `qs -c noctalia-shell`. It provides the bar, launcher, control center, notifications, lock screen, screen recorder, and session menu — all themed with Noctalia.

<details>
<summary><strong>Key bindings</strong></summary>

| Keys                   | Action                |
| ---------------------- | --------------------- |
| `Mod+Shift+D`          | App launcher          |
| `Mod+Shift+C`          | Control center        |
| `Mod+Shift+N`          | Notification history  |
| `Mod+Shift+W`          | Network panel         |
| `Mod+Shift+B`          | Bluetooth panel       |
| `Mod+Shift+M`          | Session menu          |
| `Mod+S`                | Settings              |
| `Mod+P`                | Screen toolkit        |
| `Mod+Alt+L`            | Lock screen           |
| `Mod+Alt+Ctrl+Shift+S` | Screen recorder       |
| `Mod+Shift+/`          | Keybind cheatsheet    |

</details>

---

## Ghostty

GPU-accelerated terminal emulator with a custom cursor shader.

| Setting           | Value                                |
| ----------------- | ------------------------------------ |
| Theme             | Noctalia                             |
| Font              | JetBrainsMono Nerd Font, size 15     |
| Background opacity| 0.90                                 |
| Cursor            | Block + `cursor_warp.glsl` shader    |
| Shell integration | Zsh                                  |
| Keybinds          | `Ctrl+Q` quit · `Shift+Enter` paste  |

Seven cursor shaders available in `.config/ghostty/shaders/` — swap via `custom-shader` in config.

---

## Tmux

Prefix key changed to `Ctrl+A`. All custom bindings use `Alt` so the prefix is rarely needed.

Theme uses the `catppuccin-tmux` plugin for statusbar structure, with all colors overridden to the **Kanagawa** palette (pane borders, copy mode, message styles, and status module colors all reference named Kanagawa values such as `crystalBlue`, `boatYellow2`, `fujiWhite`).

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
| `Alt+b`             | Break pane into new window          |

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
| `Alt+q` | Toggle status bar |
| `Alt+I` | Install plugins   |
| `Alt+U` | Update plugins    |

</details>

<details>
<summary><strong>Plugins</strong></summary>

| Plugin            | Description                                             |
| ----------------- | ------------------------------------------------------- |
| `tpm`             | Plugin manager                                          |
| `tmux-sensible`   | Sensible defaults                                       |
| `tmux-yank`       | Copy to system clipboard                                |
| `tmux-resurrect`  | Save & restore sessions                                 |
| `tmux-continuum`  | Auto-save sessions every 15 min                         |
| `tmux-thumbs`     | Hint-based link/path picking                            |
| `tmux-fzf`        | FZF session/window/pane switcher                        |
| `tmux-fzf-url`    | Pick & open URLs from pane                              |
| `tmux-floax`      | Floating scratch window (Kanagawa colors)               |
| `tmux-sessionx`   | Enhanced session manager                                |
| `catppuccin-tmux` | Statusbar structure; colors overridden with Kanagawa palette |

</details>

---

## Zsh

Oh My Zsh with a curated plugin set, split across files in `.config/zsh/`. Prompt via [Starship](https://starship.rs/).

<details>
<summary><strong>Plugins</strong></summary>

| Plugin                         | Description                     |
| ------------------------------ | ------------------------------- |
| `fzf-tab`                      | Replace tab-completion with fzf |
| `zsh-vi-mode`                  | Vi keybindings in the shell     |
| `zsh-autosuggestions`          | Fish-like inline suggestions    |
| `zsh-syntax-highlighting`      | Command syntax coloring         |
| `zsh-history-substring-search` | History search with up/down     |
| `git`                          | Git aliases                     |
| `pass`                         | Pass password manager completion|
| `docker`                       | Docker aliases & completion     |
| `history`                      | History aliases                 |

**Additional integrations:** `zoxide` (smart `cd`), `thefuck` (auto-correct), `fzf`, `tv` (Television file picker).

</details>

<details>
<summary><strong>Aliases & tool replacements</strong></summary>

| Alias   | Expands to                      | Tool                                                |
| ------- | ------------------------------- | --------------------------------------------------- |
| `ls`    | `eza --icons`                   | [eza](https://github.com/eza-community/eza)         |
| `ll`    | `eza --tree --level=1 -la`      | eza                                                 |
| `la`    | `eza -lah --icons --git`        | eza                                                 |
| `tree`  | `eza --tree --icons`            | eza                                                 |
| `cat`   | `bat`                           | [bat](https://github.com/sharkdp/bat)               |
| `grep`  | `rg --color=auto`               | [ripgrep](https://github.com/BurntSushi/ripgrep)    |
| `v`     | `nvim`                          | Neovim                                              |
| `lg`    | `lazygit`                       | Lazygit                                             |
| `y`     | yazi wrapper (cd-on-exit)       | [Yazi](https://github.com/sxyazi/yazi)              |
| `ff`    | `fastfetch`                     | Fastfetch                                           |
| `brf`   | `brrtfetch ~/Gifs/arch.gif …`   | brrtfetch                                           |
| `t`     | `tmux`                          | Tmux                                                |
| `c`     | `claude`                        | Claude Code CLI                                     |
| `cc`    | `claude --continue`             | Claude Code CLI (continue session)                  |
| `tvc`   | `tv channels`                   | Television                                          |
| `p`     | `python3`                       | Python                                              |
| `g`     | `git`                           | Git                                                 |

</details>

<details>
<summary><strong>Key bindings</strong></summary>

| Keys                | Action                            |
| ------------------- | --------------------------------- |
| `Ctrl+f`            | Accept autosuggestion             |
| `Ctrl+p` / `Ctrl+n` | History search backward / forward |
| `jj`                | Escape from vi insert mode        |

fzf, Television, and history bindings are re-applied in `zvm_after_init` to survive zsh-vi-mode's keymap reset.

</details>

**Version managers included:** NVM, SDKMAN, Cargo/Rust (`~/.local/bin/env`).

---

## Neovim

Built on top of [LazyVim](https://www.lazyvim.org/) with heavily customized plugins and a wide set of LazyVim extras.

<details>
<summary><strong>Plugin highlights</strong></summary>

### Theme & UI

| Plugin            | Description                                          |
| ----------------- | ---------------------------------------------------- |
| `catppuccin`      | Primary colorscheme (Mocha)                          |
| `base16-nvim`     | Base16 engine with optional `matugen` integration    |
| `lualine.nvim`    | Status line                                          |
| `bufferline.nvim` | Buffer tabs                                          |
| `neo-tree.nvim`   | File explorer                                        |
| `snacks.nvim`     | Collection of small QoL utilities                    |

### LSP & Completion

| Plugin            | Description                     |
| ----------------- | ------------------------------- |
| `nvim-lspconfig`  | Language server configurations  |
| `mason.nvim`      | LSP/linter/formatter installer  |
| `blink.cmp`       | Completion engine               |
| `nvim-treesitter` | Syntax parsing and highlighting |

### Languages (via LazyVim extras)

C/C++ · CMake · Rust · Java · Kotlin · Python · Ruby · TypeScript · SQL · Markdown · LaTeX · Typst · JSON · TOML · Docker · Git

Formatters: Black, Prettier, Biome. Linter: ESLint. LSP extras: neoconf, none-ls.

### Debugging & Testing

| Plugin                             | Description            |
| ---------------------------------- | ---------------------- |
| `nvim-dap` + `nvim-dap-ui`         | Debug Adapter Protocol |
| `neotest`                          | Test runner framework  |

### Navigation & Editing

| Plugin                      | Description               |
| --------------------------- | ------------------------- |
| `harpoon2`                  | Quick file marks          |
| `leap.nvim`                 | Fast 2-char motion        |
| `flash.nvim`                | Enhanced search/jump      |
| `mini.ai` / `mini.surround` | Extended text objects     |
| `yanky.nvim`                | Yank history              |
| `dial.nvim`                 | Smart increment/decrement |
| `inc-rename.nvim`           | Interactive LSP renaming  |
| `refactoring.nvim`          | Code refactoring tools    |
| `aerial.nvim`               | Symbol outline sidebar    |

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
| `neogen`             | Docstring generator   |
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

The `noctalia.theme` file at `.config/btop/themes/` is generated by the Noctalia project.

---

## mpv

Full-featured media player config with vi-style bindings and a rich script + shader layer.

| Setting    | Value                             |
| ---------- | --------------------------------- |
| Geometry   | 100 % × 100 % (fullscreen)        |
| OSD colors | Catppuccin Mocha palette          |
| UI         | uosc (Catppuccin Mocha colors)    |

<details>
<summary><strong>Scripts</strong></summary>

| Script      | Description                           |
| ----------- | ------------------------------------- |
| `uosc`      | Full-featured on-screen UI controller |
| `thumbfast` | Seekbar thumbnail previews            |
| `autoload`  | Auto-load files into playlist         |
| `memo`      | Bookmarks & watch history             |
| `autodeint` | Auto-apply deinterlace filter         |
| `autosub`   | Auto-download subtitles               |
| `evafast`   | Click-and-hold speed-up               |
| `console`   | Interactive mpv console               |

</details>

<details>
<summary><strong>Shader profiles</strong></summary>

| Profile         | Description                       |
| --------------- | --------------------------------- |
| `FSRCNNX`       | HD live-action upscaling          |
| `FSRCNNX+`      | SD live-action (nnedi3 + F16)     |
| `Ravu-Zoom`     | General-purpose AR upscaling      |
| `Ani4k`         | Anime 4K (ArtCNN)                 |
| `AniSD`         | SD anime (ArtCNN)                 |
| `Anime4K`       | Anime (Krigbl + A4K pipeline)     |
| `NNEDI3`        | NNEDI3 32 + sharpen               |
| `NNEDI3+`       | NNEDI3 64 + sharpen               |
| `Deband-Medium` | Deband medium strength            |
| `Deband-Strong` | Deband strong                     |
| `HDR`           | HDR passthrough (BT.2020 / PQ)    |
| `4k-Downscaling`| SSim downscale for 4K sources     |
| `Downmix-5.1`   | 5.1 → stereo downmix              |
| `Downmix-7.1`   | 7.1 → stereo downmix              |

</details>

<details>
<summary><strong>Key bindings</strong></summary>

| Keys        | Action                     |
| ----------- | -------------------------- |
| `h/l`       | Seek −5 s / +5 s           |
| `H/L`       | Seek −10 s / +10 s         |
| `j/k`       | Seek −60 s / +60 s         |
| `J/K`       | Seek −5 min / +5 min       |
| `=/−`       | Volume +2 / −2             |
| `>/< `      | Speed ×1.1 / ×0.9          |
| `0`         | Reset speed                |
| `n/N`       | Playlist next / prev       |
| `./,`       | Frame step / back          |
| `v/V`       | Cycle subtitles            |
| `a`         | Cycle audio track          |
| `s/S`       | Screenshot (with/without sub) |
| `TAB`       | Toggle uosc UI             |
| `/`         | Open mpv console           |
| `Ctrl+1–8`  | Apply shader profile       |
| `c`         | Clear all shaders          |
| `F1`        | Toggle loudnorm filter     |
| `q/Q`       | Quit / quit-watch-later    |

</details>

---

## fastfetch

Custom ASCII logo (FastCat layout) with a module set showing:
OS · Kernel · Packages · Shell · Terminal · WM · Terminal Font · Uptime · DateTime · CPU (P/E core count + temp) · Disk · Memory · Swap · Color palette.

---

## brrtfetch

Animated GIF system info widget — plays `~/Gifs/arch.gif` alongside a trimmed fastfetch output (OS · Kernel · Shell · Terminal · Uptime · CPU · Disk · Memory). Launched via the `brf` alias.

---

## gowall

[gowall](https://github.com/Achno/gowall) recolors wallpapers to match a defined palette. Two Kanagawa Paper themes are configured in `.config/gowall/config.yml`:

| Theme                 | Palette            |
| --------------------- | ------------------ |
| `kanagawa-paper-dark` | Kanagawa Paper dark tones |
| `kanagawa-paper-light`| Kanagawa Paper light tones |

Current wallpaper: `yggdrasil-tree-kanagawa_paper_HQ.png` (set via `swaybg` at startup).

---

## Fonts

JetBrainsMono Nerd Font across all tools. Install from [Nerd Fonts](https://www.nerdfonts.com/).

---

## Color themes

Three theme families are in use:

- **[Noctalia](https://github.com/noctalia/noctalia-shell)** — Ghostty, btop, Noctalia Shell. Theme files are generated by the Noctalia project; no manual color definitions.
- **[Kanagawa](https://github.com/rebelot/kanagawa.nvim)** — Tmux (pane borders, copy mode, message styles, status module color overrides), Niri window decoration gradients, gowall wallpaper palettes.
- **[Catppuccin Mocha](https://github.com/catppuccin/catppuccin)** — Neovim, Lazygit (manual hex values), mpv OSD and uosc UI colors.
