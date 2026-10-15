# Dotfiles

![License](https://img.shields.io/badge/license-MIT-blue.svg)

My terminal setup: Ghostty + tmux + Neovim, themed with **Everforest Dark Hard** and a transparent
background throughout.

## Contents

- [Neovim](#neovim)
- [tmux](#tmux)

## Neovim

A modular Lua config for **Neovim 0.12+** built on lazy.nvim, in [`nvim/`](nvim/).

- Everforest theme with a transparent background, dashboard, file tree, tab bar, smooth scrolling
- LSP, completion, formatting, linting and debugging for Lua, Python, JS/TS & web, Rust, Go,
  C/C++, Java and C#
- Fuzzy finder, git integration, markdown and CSV preview
- `<C-h/j/k/l>` moves between Neovim splits and tmux panes with the same keys

Install:

```sh
cp -r nvim ~/.config/nvim   # or: ln -s "$PWD/nvim" ~/.config/nvim
nvim                        # plugins and language tools install on first start
```

👉 **See [`nvim/README.md`](nvim/README.md)** for requirements, the full plugin list, keymaps and how-tos.

## tmux

Config file: `~/.tmux.conf`, for tmux 3.3+. Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm).

### Features

- **Everforest Dark Hard** status bar, pane borders and messages, with no status-bar background so
  the terminal's transparency shows through
- Session name in a green block that turns **orange while the prefix is active**
- Current window in green bold italic, matching the Neovim tab bar
- True color, mouse support, 50,000 lines of scrollback, windows and panes numbered from 1
- No `<Esc>` delay and focus events turned on, for Neovim
- Splits and new windows open in the current folder
- Vi copy mode that copies to the system clipboard

### Plugins

| Plugin | Purpose |
|---|---|
| [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) | Plugin manager |
| [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible defaults |
| [tmux-plugins/tmux-yank](https://github.com/tmux-plugins/tmux-yank) | `y` in copy mode copies to the system clipboard |
| [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `C-h/j/k/l` across tmux panes and Neovim splits (the Neovim side is in `nvim/`) |

### Install

Requirements: tmux 3.3+, `git`, a [Nerd Font](https://www.nerdfonts.com/) in the terminal, and a
clipboard tool: `wl-copy` (Wayland), `xclip`/`xsel` (X11) or `pbcopy` (macOS).

```sh
# 1. Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 2. Put the config in place (back up any existing one first)
cp ~/.tmux.conf ~/.tmux.conf.bak 2>/dev/null
cp .tmux.conf ~/.tmux.conf

# 3. Start tmux and install the plugins
tmux
# then press: C-b I
```

If tmux was already running, restart the server (`tmux kill-server`) so true color and the theme
apply.

### Keys

The prefix is the default **`C-b`**. Press `C-b` twice to send a literal `C-b` to the program inside.

| Key | Action |
|---|---|
| `C-h/j/k/l` (no prefix) | Move between tmux panes **and** Neovim splits |
| `prefix \|` / `prefix -` | Split side by side / top and bottom (current folder) |
| `prefix c` | New window (current folder) |
| `prefix n` / `prefix p` / `prefix 1-9` | Next / previous / numbered window |
| `prefix <` / `prefix >` | Move window left / right |
| `prefix H/J/K/L` | Resize pane (hold to repeat) |
| `prefix z` | Zoom pane (󰊓 shows in the status bar) |
| `prefix x` | Close pane |
| `prefix d` | Detach (`tmux a` to reattach) |
| `prefix s` | Pick a session or window |
| `prefix C-l` | Clear the shell (plain `C-l` is pane navigation) |
| `prefix r` | Reload `~/.tmux.conf` |
| `prefix I` / `prefix U` | Install / update plugins (TPM) |

### Copy mode

| Key | Action |
|---|---|
| `prefix [` | Enter copy mode (`COPY` shows in the status bar) |
| `h/j/k/l`, `w/b`, `C-u/C-d`, `/` `?` | Move and search like Vim |
| `v` / `C-v` | Start a selection / toggle block selection |
| `y` | Copy to the system clipboard and leave copy mode |
| `Esc` or `q` | Leave copy mode |

Selecting text with the mouse also copies it.

### Customize

- **Colors:** the Everforest palette is a set of variables (`bg1`, `fg`, `green`, …) in the theme
  section of `~/.tmux.conf`. Change them there; the palette is listed in
  [Everforest's docs](https://github.com/sainnhe/everforest/blob/master/palette.md).
- **Status bar position:** `set -g status-position top`.
- **A different prefix**, e.g. `C-a`: replace `C-b` in the first two `set -g prefix` / `bind` lines.

## License

[MIT](LICENSE)
