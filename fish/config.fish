if status is-interactive
    # Commands to run in interactive sessions can go here

    # Everforest Dark Hard syntax colors (~/.config/fish/themes/everforest-dark-hard.theme)
    fish_config theme choose everforest-dark-hard --color-theme=dark
end

set -g fish_greeting "Hello, DizZy"

set -gx EDITOR nvim
set -gx VISUAL nvim

alias vim "nvim"
alias cat "bat --paging=never"
alias ls "eza --icons --color"
alias la "eza -A -l -g --icons --color"
alias ll "eza -l -g --icons --color"

starship init fish | source

export PATH="$HOME/.local/bin:$PATH"
