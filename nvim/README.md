# DizZy's Neovim config

A modular Lua config for **Neovim 0.12+** built on [lazy.nvim](https://github.com/folke/lazy.nvim).
It uses Neovim's native LSP API (`vim.lsp.config` / `vim.lsp.enable`), the everforest theme with a
transparent background (made for Ghostty), and full tooling for Lua, Python, JS/TS & web, Rust, Go,
C/C++, Java and C#.

```
 ____   _       _____
|  _ \ (_) ____|__  / _   _
| | | || ||_  /  / / | | | |
| |_| || | / /  / /_ | |_| |
|____/ |_|/___|/____| \__, |
                      |___/
```

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Folder structure](#folder-structure)
- [Plugins](#plugins)
- [Language support](#language-support)
- [Keymaps](#keymaps)
- [How-to](#how-to)
- [tmux](#tmux)
- [Troubleshooting](#troubleshooting)

## Requirements

| Tool | Needed for |
|---|---|
| Neovim ≥ 0.12 | everything |
| `git`, `curl`, `unzip` | lazy.nvim and Mason downloads |
| `gcc`, `make` | compiling treesitter parsers |
| `tree-sitter` CLI | nvim-treesitter (`main` branch) |
| `ripgrep` | grep picker |
| `fd` | fast file picker (optional) |
| A [Nerd Font](https://www.nerdfonts.com/) set as the terminal font | icons |
| `node` / `npm` | JS/TS, HTML/CSS/JSON servers, prettierd |
| `python3` | basedpyright, debugpy |
| JDK 21+ | jdtls, google-java-format |
| `go` | gopls, gofumpt, goimports, golangci-lint, delve |
| [`rustup`](https://rustup.rs) | Rust toolchain, rustfmt, clippy |
| `dotnet` SDK | roslyn, csharpier, netcoredbg |
| [`lazygit`](https://github.com/jesseduffield/lazygit#installation) | `<Space>gg` (optional) |

Go and C# tools are only installed by Mason when `go` / `dotnet` are on your `PATH`, so you can skip
those languages without errors. After installing a toolchain, restart Neovim and Mason fetches the
matching tools automatically.

## Installation

```sh
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone / copy this config into ~/.config/nvim, then:
nvim
```

On first start lazy.nvim installs itself and every plugin, treesitter compiles its parsers, and Mason
installs the language servers and tools in the background. Wait for it to finish, then restart.

Headless install (e.g. for a new machine):

```sh
nvim --headless "+Lazy! sync" +qa
```

## Folder structure

```
~/.config/nvim/
├── init.lua                  -- leader keys, loads config.* modules
├── lazy-lock.json            -- pinned plugin versions (generated, commit it)
├── .stylua.toml              -- formatting rules for this config
├── lua/
│   ├── config/
│   │   ├── options.lua       -- editor options + diagnostic display
│   │   ├── keymaps.lua       -- general keymaps
│   │   ├── autocmds.lua      -- yank highlight, restore cursor, trim whitespace, ...
│   │   └── lazy.lua          -- lazy.nvim bootstrap and setup
│   └── plugins/              -- one file per concern, each returns lazy specs
│       ├── colorscheme.lua   -- everforest + transparency
│       ├── ui.lua            -- snacks (dashboard, picker, explorer...), bufferline, lualine,
│       │                     -- which-key, neoscroll, smear-cursor
│       ├── editor.lua        -- mini.nvim, oil, flash, vim-tmux-navigator, trouble
│       ├── csv.lua           -- csvview
│       ├── markdown.lua      -- markview
│       ├── treesitter.lua    -- parsers, highlighting, indent, folds
│       ├── lsp.lua           -- mason, mason-lspconfig, LspAttach keymaps, lazydev
│       ├── completion.lua    -- blink.cmp
│       ├── formatting.lua    -- conform
│       ├── linting.lua       -- nvim-lint
│       ├── git.lua           -- gitsigns
│       ├── debug.lua         -- nvim-dap + UI
│       └── lang/
│           ├── java.lua      -- nvim-jdtls
│           ├── csharp.lua    -- roslyn.nvim
│           └── rust.lua      -- rustaceanvim
├── after/
│   ├── lsp/                  -- per-server settings, merged over nvim-lspconfig defaults
│   │   ├── lua_ls.lua
│   │   ├── basedpyright.lua
│   │   ├── vtsls.lua
│   │   └── clangd.lua
│   └── ftplugin/             -- per-filetype indent settings
└── snippets/                 -- your own snippets (VS Code JSON format)
```

Load order: `init.lua` → `config.options` → `config.keymaps` → `config.autocmds` → `config.lazy`.

## Plugins

### Core

| Plugin | Purpose | File |
|---|---|---|
| [folke/lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager with lazy-loading and lockfile | `config/lazy.lua` |
| [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`main`) | Syntax highlighting, indent, folds | `plugins/treesitter.lua` |
| [nvim-treesitter/nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) (`main`) | Function/class/block queries for mini.ai | `plugins/treesitter.lua` |

### LSP, completion, formatting, linting

| Plugin | Purpose | File |
|---|---|---|
| [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Default server configs | `plugins/lsp.lua` |
| [mason-org/mason.nvim](https://github.com/mason-org/mason.nvim) | Installs servers, formatters, linters, debuggers | `plugins/lsp.lua` |
| [mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) | Installs + auto-enables LSP servers | `plugins/lsp.lua` |
| [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Installs non-LSP tools | `plugins/lsp.lua` |
| [b0o/SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim) | JSON schemas for jsonls | `plugins/lsp.lua` |
| [folke/lazydev.nvim](https://github.com/folke/lazydev.nvim) | Neovim API types when editing this config | `plugins/lsp.lua` |
| [saghen/blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine | `plugins/completion.lua` |
| [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Snippet collection | `plugins/completion.lua` |
| [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) | Formatting + format-on-save | `plugins/formatting.lua` |
| [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) | Linters not covered by an LSP | `plugins/linting.lua` |

### Language-specific

| Plugin | Purpose | File |
|---|---|---|
| [mrcjkb/rustaceanvim](https://github.com/mrcjkb/rustaceanvim) | rust-analyzer integration, runnables, debugging | `plugins/lang/rust.lua` |
| [mfussenegger/nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) | Java LSP with per-project workspaces | `plugins/lang/java.lua` |
| [seblyng/roslyn.nvim](https://github.com/seblyng/roslyn.nvim) | C# Roslyn language server | `plugins/lang/csharp.lua` |

### UI & editing

| Plugin | Purpose | File |
|---|---|---|
| [sainnhe/everforest](https://github.com/sainnhe/everforest) | Colorscheme (hard, transparent) | `plugins/colorscheme.lua` |
| [folke/snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, picker, file explorer, notifier, indent guides, input, lazygit, terminal, bigfile, statuscolumn | `plugins/ui.lua` |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline | `plugins/ui.lua` |
| [folke/which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints popup | `plugins/ui.lua` |
| [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | Smooth scrolling | `plugins/ui.lua` |
| [sphamba/smear-cursor.nvim](https://github.com/sphamba/smear-cursor.nvim) | Cursor movement animation | `plugins/ui.lua` |
| [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Open buffers as tabs across the top | `plugins/ui.lua` |
| [nvim-mini/mini.nvim](https://github.com/nvim-mini/mini.nvim) | `mini.icons`, `mini.pairs`, `mini.surround`, `mini.ai` | `plugins/editor.lua` |
| [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) | Edit directories like a buffer | `plugins/editor.lua` |
| [folke/flash.nvim](https://github.com/folke/flash.nvim) | Jump anywhere on screen | `plugins/editor.lua` |
| [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `<C-h/j/k/l>` across Neovim splits and tmux panes | `plugins/editor.lua` |
| [folke/trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics / quickfix / symbols list | `plugins/editor.lua` |
| [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs, hunks, blame | `plugins/git.lua` |
| [hat0uma/csvview.nvim](https://github.com/hat0uma/csvview.nvim) | Aligned table view for CSV/TSV | `plugins/csv.lua` |
| [OXY2DEV/markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown preview rendered in the buffer | `plugins/markdown.lua` |

### Debugging

| Plugin | Purpose | File |
|---|---|---|
| [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client | `plugins/debug.lua` |
| [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | Debugger UI (opens automatically) | `plugins/debug.lua` |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async library for dap-ui | `plugins/debug.lua` |
| [jay-babu/mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Configures Mason-installed debug adapters | `plugins/debug.lua` |

The snacks explorer replaces a separate tree plugin such as nvim-tree or neo-tree.

Built-in Neovim features used instead of plugins: commenting (`gc`), LSP default keymaps, `vim.hl.on_yank`,
treesitter folds.

## Language support

| Language | LSP | Formatter | Linter | Debugger |
|---|---|---|---|---|
| Lua | lua_ls | stylua | lua_ls | — |
| Python | basedpyright | ruff (imports + format) | ruff (LSP) | debugpy |
| JS / TS | vtsls | prettierd | eslint (LSP, needs project config) | js-debug-adapter |
| HTML / CSS / JSON / YAML / Markdown | html, cssls, jsonls | prettierd | — | — |
| Rust | rust-analyzer (rustaceanvim) | rustfmt | clippy | codelldb |
| Go | gopls | goimports + gofumpt | golangci-lint | delve |
| C / C++ | clangd (+ clang-tidy) | clang-format | clang-tidy | codelldb |
| Java | jdtls (nvim-jdtls) | google-java-format | jdtls | java-debug-adapter, java-test |
| C# | roslyn | csharpier | roslyn | netcoredbg |

Treesitter parsers: bash, c, c_sharp, cpp, css, diff, gitcommit, go, gomod, gosum, html, java,
javascript, json, lua, luadoc, markdown, markdown_inline, python, query, regex, rust, toml, tsx,
typescript, vim, vimdoc, yaml.

## Keymaps

Leader is **`<Space>`**, local leader is **`\`**. Press `<Space>` and wait to see every group in which-key.

### Can't remember a key?

| Key | Shows |
|---|---|
| `<Space>` (wait) | Popup of every leader key, grouped; press a letter to drill down |
| `g`, `z`, `[`, `]`, `<C-w>`, `"`, `'` (wait) | The same popup for Neovim's built-in prefixes |
| `d`, `y`, `c`, `v` (wait) | Motions and text objects you can use next |
| `<Space>?` | Only the keys that work in the current buffer (LSP, git, CSV, …) |
| `<Space>fk` | Fuzzy search over every keymap; `<CR>` runs it |
| `?` / `g?` | Help inside the file tree, pickers, Lazy, Mason / oil |
| `:help index` | All built-in Neovim keys |

### General

| Key | Mode | Action |
|---|---|---|
| `<Esc>` | n | Clear search highlight |
| `<C-s>` | n, i, x | Save file |
| `<C-h/j/k/l>` | n | Move between windows (and tmux panes) |
| `<A-j>` / `<A-k>` | n, x | Move line(s) down / up |
| `<` / `>` | x | Indent and keep selection |
| `gc` / `gcc` | n, x | Toggle comment (built-in) |
| `<C-/>` | n, t | Toggle terminal |
| `<Esc><Esc>` | t | Leave terminal mode |
| `<Space>l` | n | Open Lazy (plugin manager) |
| `<Space>un` | n | Dismiss notifications |

### Buffers / tabs (bufferline)

Every open file is a buffer, shown as a tab in the top bar. Tabs start after the file tree when it is open.
The selected tab is shown in bold italic, with no indicator lines.

| Key / mouse | Action |
|---|---|
| `<S-h>` / `<S-l>` | Previous / next tab |
| `<A-,>` / `<A-.>` | Move tab left / right |
| `<Space>bj` | Pick a tab by letter |
| `<Space>fb` | Search open buffers |
| `<Space>bp` | Pin / unpin tab |
| `<Space>bP` | Close all unpinned tabs |
| `<Space>bd` / `<Space>bo` | Close tab / close all other tabs |
| `<Space>bl` / `<Space>br` | Close tabs to the left / right |
| Left-click | Switch to tab |
| Right-click or close icon | Close tab |

Drag-and-drop reordering isn't supported; use `<A-,>` / `<A-.>`. A custom order lasts until you quit Neovim.

These tabs are buffers, not Neovim *tab pages*. A tab page is a separate window layout; you rarely need
one, but `<C-t>` in a picker opens the selected file in a new tab page (`gt` / `gT` to switch).

### Find (snacks picker)

| Key | Action |
|---|---|
| `<Space><Space>` | Smart file finder |
| `<Space>ff` | Find files |
| `<Space>/` or `<Space>fg` | Grep project |
| `<Space>fw` | Grep word under cursor / selection |
| `<Space>fb` | Buffers |
| `<Space>fr` | Recent files |
| `<Space>fh` | Help pages |
| `<Space>fk` | Keymaps |
| `<Space>fd` | Diagnostics |
| `<Space>fs` | LSP symbols |
| `<Space>fc` | Files in this config |
| `<Space>fn` | Notification history |

Inside a picker: `<C-j>/<C-k>` move, `<CR>` open, `<C-v>`/`<C-s>` open in vsplit/split, `<Esc>` close, `?` help.

### File explorer

| Key | Action |
|---|---|
| `<Space>e` | Toggle the tree on the left (snacks explorer) |
| `<Space>E` | Reveal the current file in the tree |
| `-` | Open the parent directory in oil |

Opening a file from the tree shows it in the editor window on the right and keeps the tree open.
`<C-h>` moves the cursor to the tree and `<C-l>` back to the file. `<Space>e` closes the tree even when
the cursor is in the file, so use `<C-h>` to go back to it.

In the tree: `l`/`<CR>` open, `<C-v>` / `<C-s>` open in a vertical / horizontal split, `h` collapse, `a` add (end with `/` for a folder), `r` rename, `d` delete,
`y` copy, `p` paste, `m` move, `H` toggle hidden, `I` toggle ignored, `<C-t>` terminal, `?` all keys.

In oil: edit the buffer like text (rename lines, delete lines, add lines) and `:w` to apply; `<CR>` open, `-` go up, `g?` help.

### Windows / splits

A split shows two buffers side by side. The tab bar doesn't change; each window just shows a buffer.

| Key / command | Action |
|---|---|
| `<C-v>` / `<C-s>` in the tree or a picker | Open the file in a vertical / horizontal split |
| `<C-w>v` / `<C-w>s` | Split the current window vertically / horizontally, then switch buffer in it |
| `:vsplit <file>` | Open a file in a vertical split |
| `:vert sbuffer <n>` | Open buffer number `n` in a vertical split |
| `<C-h/j/k/l>` | Move the cursor to the left / lower / upper / right window (includes the tree and tmux panes) |
| `<C-w>w` / `<C-w>p` | Cycle windows / jump to the previous window |
| `<C-w>q` | Close the split (the buffer stays open as a tab) |
| `<C-w>o` | Close all other splits |
| `<C-w>=` | Make all splits equal size |
| `<C-w><` / `<C-w>>` | Narrower / wider |
| `<C-w>x` | Swap the two splits |
| `<C-w>H` / `<C-w>L` | Move the current split to the far left / right |

### Saving / quitting

`:wq` only closes the current window, so with two buffers and the tree open it takes three tries.
Use the "all" versions instead:

| Command | Action |
|---|---|
| `:wqa` or `:xa` | Save all changed files and quit |
| `:qa` | Quit; asks Yes / No / Cancel for each unsaved file (`confirm` is on) |
| `:qa!` | Quit and discard all unsaved changes |
| `:wa` | Save all files without quitting |
| `<C-s>` | Save the current file |

### LSP

| Key | Action |
|---|---|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `grr` | References |
| `gri` | Implementation |
| `grt` | Type definition |
| `grn` or `<Space>cr` | Rename |
| `gra` or `<Space>ca` | Code action |
| `gO` | Document symbols |
| `[d` / `]d` | Previous / next diagnostic |
| `<Space>cd` | Line diagnostics popup |
| `<Space>ch` | Toggle inlay hints |
| `<Space>cf` | Format buffer / selection |
| `<Space>cs` | Symbols outline (trouble) |

### Diagnostics (trouble)

| Key | Action |
|---|---|
| `<Space>xx` | Project diagnostics |
| `<Space>xX` | Buffer diagnostics |
| `<Space>xq` | Quickfix list |
| `<Space>xl` | Diagnostics to location list |

### Completion (blink.cmp)

| Key | Action |
|---|---|
| `<C-space>` | Open menu / toggle docs |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<C-y>` | Accept |
| `<C-e>` | Close menu |
| `<C-b>` / `<C-f>` | Scroll documentation |
| `<Tab>` / `<S-Tab>` | Jump in snippet |
| `<C-k>` | Toggle signature help |

### Editing

| Key | Action |
|---|---|
| `s` | Flash jump (type chars, then the label) |
| `S` | Flash treesitter selection |
| `r` (operator) / `R` | Remote flash / treesitter search |
| `gsa{motion}{char}` | Add surround, e.g. `gsaiw"` |
| `gsd{char}` | Delete surround, e.g. `gsd"` |
| `gsr{old}{new}` | Replace surround, e.g. `gsr"'` |
| `af`/`if` | Function call text object |
| `aF`/`iF` | Function definition (treesitter) |
| `ac`/`ic` | Class (treesitter) |
| `ao`/`io` | Block / conditional / loop |
| `aa`/`ia` | Argument |
| `aq`/`iq`, `ab`/`ib` | Quotes, brackets |
| `za` / `zR` / `zM` | Toggle fold / open all / close all |

### Scrolling (neoscroll)

These keys scroll smoothly instead of jumping. `<C-b>` is left to tmux as its prefix, so page up is
`<PageUp>`.

| Key | Action |
|---|---|
| `<C-d>` / `<C-u>` | Half page down / up |
| `<PageDown>` / `<PageUp>` (also `<C-f>` down) | Full page down / up |
| `<C-e>` / `<C-y>` | One line down / up |
| `zz` / `zt` / `zb` | Put the cursor line in the center / top / bottom of the screen |

Speed and feel are set in the neoscroll spec in `lua/plugins/ui.lua`: `duration_multiplier` (lower is faster)
and `easing` (`"linear"`, `"quadratic"`, `"cubic"`, `"sine"`, …).

### Git

| Key | Action |
|---|---|
| `<Space>gg` | Lazygit |
| `]h` / `[h` | Next / previous hunk |
| `<Space>gs` | Stage hunk (or selection) |
| `<Space>gr` | Reset hunk (or selection) |
| `<Space>gp` | Preview hunk inline |
| `<Space>gb` | Blame line |
| `<Space>gd` | Diff this file |
| `<Space>gl` | Git log |
| `<Space>gS` | Git status |
| `ih` | Hunk text object |

### Debugging

| Key | Action |
|---|---|
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Conditional breakpoint |
| `<Space>dc` | Start / continue |
| `<Space>di` / `<Space>do` / `<Space>dO` | Step into / over / out |
| `<Space>dr` | Toggle REPL |
| `<Space>dt` | Terminate |
| `<Space>du` | Toggle debugger UI |
| `<Space>de` | Evaluate expression |

Rust: `:RustLsp debuggables` / `:RustLsp runnables`.

### Markdown (markview)

Markdown files are rendered in the buffer automatically: headings, tables, lists, checkboxes, code
blocks, links and callouts. The cursor line shows raw text in normal mode, and the whole buffer shows
raw text in insert mode.

| Key / command | Action |
|---|---|
| `<Space>um` / `:Markview toggle` | Toggle the preview |
| `<Space>uM` / `:Markview splitToggle` | Show the preview in a split next to the raw text |
| `:Markview HybridToggle` | Toggle showing raw text on the cursor line |

### CSV / TSV

Opening a `.csv` or `.tsv` file shows it as an aligned table automatically.

| Key / command | Action |
|---|---|
| `:CsvViewToggle` | Toggle table view |
| `<Tab>` / `<S-Tab>` | Next / previous field |
| `if` / `af` | Field text object |

## How-to

### Add a plugin

Create a file in `lua/plugins/` (or add to an existing one) that returns a lazy spec:

```lua
-- lua/plugins/todo.lua
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {},
}
```

Restart Neovim; lazy.nvim installs it. Prefer lazy-loading with `event`, `cmd`, `ft` or `keys`.

### Remove a plugin

Delete its spec, restart, then run `:Lazy clean`.

### Update plugins

`:Lazy update` (or `:Lazy sync`). `lazy-lock.json` records the versions; roll back with `:Lazy restore`.
Update Mason packages with `:Mason` → `U`.

### Add a language server

1. Find the server name in `:help lspconfig-all` (e.g. `yamlls`).
2. Add it to the `servers` list in `lua/plugins/lsp.lua`. mason-lspconfig installs and enables it.
3. Optional settings: create `after/lsp/<name>.lua` returning a config table:

   ```lua
   -- after/lsp/yamlls.lua
   return {
     settings = { yaml = { keyOrdering = false } },
   }
   ```

4. Add the treesitter parser to the `parsers` list in `lua/plugins/treesitter.lua`.

### Add a formatter or linter

1. Add the Mason package name to `tools` in `lua/plugins/lsp.lua`.
2. Map it to a filetype in `formatters_by_ft` (`lua/plugins/formatting.lua`) or
   `linters_by_ft` (`lua/plugins/linting.lua`).

Check what runs on the current buffer with `:ConformInfo`.

### Turn format-on-save off

- `:FormatToggle` — toggle globally.
- `:FormatToggle!` — toggle for the current buffer only.

### Change the theme or transparency

Edit `lua/plugins/colorscheme.lua`:

- `vim.g.everforest_background` — `"hard"`, `"medium"` or `"soft"`.
- `vim.g.everforest_transparent_background` — `0` solid, `1` editor transparent, `2` also statusline/floats.
- The `ColorScheme` autocmd clears float backgrounds; add `"Pmenu"` to its list for a transparent
  completion menu.

How see-through the background is comes from the terminal. In `~/.config/ghostty/config.ghostty`:

```
background-opacity = 0.9
background-blur = true
```

To use a different colorscheme, replace the plugin in `colorscheme.lua` and update `theme` in
lualine (`lua/plugins/ui.lua`).

### Change the tab bar style

In the bufferline spec in `lua/plugins/ui.lua`:

- `indicator = { style = "none" }` — use `"underline"` to underline the selected tab, or `"icon"` for a bar.
- `separator_style = { "", "" }` — no dividers; try `"thin"`, `"slant"` or `"slope"`.
- `highlights.buffer_selected` — the selected tab's text style (`bold`, `italic`).

### Change the dashboard header

Edit the `header` string at the top of `lua/plugins/ui.lua`. Its color is the `SnacksDashboardHeader`
highlight set in `colorscheme.lua`.

### Add custom snippets

Put VS Code-style snippet files in `snippets/` with a `package.json`:

```json
// snippets/package.json
{
  "contributes": {
    "snippets": [{ "language": "python", "path": "./python.json" }]
  }
}
```

```json
// snippets/python.json
{
  "main guard": {
    "prefix": "ifmain",
    "body": ["if __name__ == \"__main__\":", "    ${1:main()}"]
  }
}
```

### Change indent width for a language

Edit or add `after/ftplugin/<filetype>.lua`. The default is 2 spaces; Python, Java, C/C++, C# and
Rust use 4; Go uses tabs.

### Java projects

jdtls starts automatically for `.java` files and keeps a separate workspace per project in
`~/.local/share/nvim/jdtls-workspace/`. If a project gets into a bad state, delete its folder there.

## tmux

`~/.tmux.conf` (not part of this repo) is set up to match: Everforest Dark Hard colors with a
transparent status bar, true color, mouse, vi copy mode, and no `<Esc>` delay for Neovim.
Plugins are managed by [TPM](https://github.com/tmux-plugins/tpm): `prefix + I` install, `prefix + U` update.

The prefix is the default **`C-b`**. Press `C-b` twice to send it to the program inside.

| Key | Action |
|---|---|
| `C-h/j/k/l` (no prefix) | Move between tmux panes **and** Neovim splits |
| `prefix \|` / `prefix -` | Split side by side / top and bottom (opens in the current folder) |
| `prefix c` | New window (current folder) |
| `prefix n` / `prefix p` / `prefix 1-9` | Next / previous / numbered window |
| `prefix <` / `prefix >` | Move window left / right |
| `prefix H/J/K/L` | Resize pane (hold to repeat) |
| `prefix z` | Zoom pane (󰊓 shows in the status bar) |
| `prefix x` | Close pane |
| `prefix d` | Detach (`tmux a` to reattach) |
| `prefix s` | Pick a session |
| `prefix C-l` | Clear the shell (plain `C-l` is pane navigation) |
| `prefix [` | Copy mode: `v` select, `C-v` block, `y` copy to the system clipboard, `Esc` quit |
| `prefix r` | Reload `~/.tmux.conf` |

The session name in the status bar turns orange while the prefix is active.

## Troubleshooting

| Problem | Try |
|---|---|
| Something is broken | `:checkhealth` (or `:checkhealth lazy`, `vim.lsp`, `mason`, `nvim-treesitter`, `blink.cmp`, `conform`) |
| LSP not attaching | `:checkhealth vim.lsp`; check the server is installed in `:Mason`; `:LspLog` |
| Tool failed to install | `:Mason` → highlight it, press `i` to retry; `:MasonLog` |
| No highlighting | `:InspectTree`; reinstall with `:TSInstall! <lang>`; needs `tree-sitter` CLI |
| Icons are boxes / question marks | Set a Nerd Font in the terminal |
| Formatting not running | `:ConformInfo`; check `:FormatToggle` state |
| Slow startup | `:Lazy profile` |
| Plugin errors after update | `:Lazy restore` to go back to `lazy-lock.json` versions |
| `p` doesn't paste text copied in another app | Use `Ctrl+Shift+V`. The clipboard uses OSC 52 (set in `lua/config/options.lua`): copying goes to the system clipboard, but `p` only pastes Neovim's own last copy, because `wl-paste` would pop up a "wl-clipboard is ready" notice on GNOME |
| Colors look wrong inside tmux | Restart the tmux server (`tmux kill-server`) so `default-terminal` / true color apply |
| Start completely fresh | `rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim` and restart |
