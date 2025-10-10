#--==========================================================
#--=== Fish settings
#--==========================================================
set -g fish_history_size 10000
set -g fish_history_path ~/.local/share/fish/fish_history
set -g fish_complete_path ~/.config/fish/completions

#--==========================================================
#--=== Source tool configs
#--==========================================================
zoxide init fish | source
starship init fish | source
fzf --fish | source

#--==========================================================
#--=== Command Aliases
#--==========================================================
alias ll "eza -la --git"
alias la "eza -la"
alias l "eza -l"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias cat "bat"
alias ls "eza"
alias find "fd"
alias grep "rg"
alias man "tldr"

#--==========================================================
#--=== Color Scheme
#--==========================================================
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    base16-google-dark
end
