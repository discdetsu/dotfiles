# fzf — Everforest Dark Hard colors, fd for listing, bat/eza for previews
# Keys: Ctrl-T insert file path, Ctrl-R search history, Alt-C cd into a folder
# Inside fzf: Ctrl-/ toggles the preview window
status is-interactive; or exit

set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

set -gx FZF_DEFAULT_OPTS "\
--height=60% --layout=reverse --border=rounded --info=inline-right \
--prompt='❯ ' --pointer='▌' --marker='+' --separator='─' \
--bind='ctrl-/:toggle-preview' \
--preview='if test -f {}; bat --color=always --style=numbers,changes --line-range=:300 {}; else if test -d {}; eza --tree --level=2 --icons --color=always {}; end' \
--preview-window='right,60%,border-left' \
--color=bg+:#374145,bg:-1,gutter:-1,border:#414b50,separator:#414b50,scrollbar:#414b50 \
--color=fg:#d3c6aa,fg+:#d3c6aa,hl:#a7c080,hl+:#a7c080:bold \
--color=info:#859289,prompt:#a7c080,pointer:#a7c080,marker:#dbbc7f,spinner:#83c092,header:#7fbbb3 \
--color=preview-border:#414b50,label:#83c092,query:#d3c6aa"

# Ctrl-T: files and folders (uses the default bat/eza preview above)
set -gx FZF_CTRL_T_COMMAND 'fd --hidden --follow --exclude .git'

# Alt-C: folders with an eza tree preview
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
set -gx FZF_ALT_C_OPTS "--preview='eza --tree --level=2 --icons --color=always {}'"

# Ctrl-R: history, long commands wrapped in a small preview
set -gx FZF_CTRL_R_OPTS "--preview='echo {}' --preview-window='down,3,wrap,hidden' --bind='?:toggle-preview'"

fzf --fish | source

# `fzfp` — standalone file picker with bat preview; opens the choice in nvim
function fzfp --description 'Pick a file with bat preview and open it in nvim'
    set -l file (fzf --preview='bat --color=always --style=numbers,changes --line-range=:300 {}' \
        --preview-window='right,60%,border-left' $argv)
    and $EDITOR $file
end
