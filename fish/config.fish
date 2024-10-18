if status is-interactive
	function fish_greeting
		echo "Hi! DizZy" | cowsay | lolcat
	end
	
	alias ls='eza --color=always --icons=always'
	alias ll='eza -l --color=always --icons=always'
	alias la='eza -la --color=always --icons=always'
	alias lt='eza --tree --color=always --icons=always'
	
	alias vim='nvim'

	alias cat='bat'

end

# Created by `pipx` on 2024-09-14 05:00:18
set PATH $PATH /home/dizzy/.local/bin

# Everforest
set -g fish_color_autosuggestion 859289
set -g fish_color_cancel -r
set -g fish_color_command --bold a7c080
set -g fish_color_comment e67e80
set -g fish_color_cwd a7c080
set -g fish_color_cwd_root e67e80
set -g fish_color_end d699b6
set -g fish_color_error e67e80
set -g fish_color_escape dbbc7f
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=7fbbb3
set -g fish_color_normal d3c6aa
set -g fish_color_operator dbbc7f
set -g fish_color_param 83c092
set -g fish_color_quote dbbc7f
set -g fish_color_redirection 7fbbb3
set -g fish_color_search_match 'dbbc7f' '--background=4f5b58'
set -g fish_color_selection 'white' '--bold' '--background=4f5b58'
set -g fish_color_user a7c080
set -g fish_color_valid_path --underline

thefuck --alias | source
direnv hook fish | source
direnv export fish | source
starship init fish | source

