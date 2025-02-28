# Dotfiles

![License](https://img.shields.io/badge/license-MIT-blue.svg)  
A collection of configuration files (dotfiles) to personalize and optimize for my development environment.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This repository contains my personal configuration files (dotfiles) for various tools and applications. These dotfiles are designed to streamline workflows, maintain consistency across environments, and save setup time when switching devices or working on fresh installations.

## Features
- **Shell Configurations**: Custom `fish` settings.
- **Vim/Neovim**: Enhanced editor experience with plugins and themes. [Coming soon]
- **Git Configurations**: Aliases, commit templates, and improved usability. [Coming soon]
- **Tmux**: Session management setup for multitasking. [Coming soon]
- **Custom Scripts**: Handy utilities to simplify daily tasks.
- **Themes**: Powerline, NerdFonts, and color schemes.

## Installation
### Prerequisites
- A Unix-like operating system (Linux/macOS).
- For Windows may need some tweakings.
- Git installed.

### Clone the Repository
```bash
git clone https://github.com/dizzy/dotfiles.git ~/dotfiles
```

### Run the Installation Script
```bash
cd ~dotfiles
sudo chmod +x dotfiles/.install.sh
./install.sh
``` 

## Vim
### Project Structure

```plaintext
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── autocmds.lua
│	│	├── ui.lua
│   ├── plugins/
│   │   ├── coding.lua
│   │   ├── lsp.lua
│   │   ├── git.lua
│   │   ├── tools.lua
└── after/
    ├── ftplugin/
    ├── plugin/
```
- `init.lua` Main entry point; loads Lua modules.
- `lua/keymaps.lua` Custom key mappings.
- `lua/autocmds.lua` Auto commands.
- `lua/plugins/ ` Individual plugin configurations.
- `after/ftplugin/` Language-specific settings.
- `after/plugin/` Post-plugin customization.

### Plugins
[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
[bufferline](https://github.com/nvim-tree/nvim-tree.lua)
[lualine](https://github.com/nvim-lualine/lualine.nvim)
