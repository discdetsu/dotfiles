set fish_greeting "
██████████    ███             ███████████           
░░███░░░░███  ░░░             ░█░░░░░░███            
 ░███   ░░███ ████   █████████░     ███░   █████ ████
 ░███    ░███░░███  ░█░░░░███      ███    ░░███ ░███ 
 ░███    ░███ ░███  ░   ███░      ███      ░███ ░███ 
 ░███    ███  ░███    ███░   █  ████     █ ░███ ░███ 
 ██████████   █████  █████████ ███████████ ░░███████ 
░░░░░░░░░░   ░░░░░  ░░░░░░░░░ ░░░░░░░░░░░   ░░░░░███ 
                                            ███ ░███ 
                                           ░░██████  
                                            ░░░░░░   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# aliases
alias vim "nvim"
alias ls "eza --icons --color"
alias la "eza -A -l -g --icons --color"
alias ll "eza -l -g --icons --color"
alias g git

command -qv nvim && alias vim nvim

direnv hook fish | source
direnv export fish | source
starship init fish | source