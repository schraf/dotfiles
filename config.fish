# Paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Environment Variables
set -x TINTED_TMUX_OPTION_ACTIVE 1
set -x TINTED_TMUX_OPTION_ACTIVE 1

# zoxide
zoxide init fish | source

# starship prompt
starship init fish | source

# Better history management
set -g fish_history_size 10000
set -g fish_history_path ~/.local/share/fish/fish_history

# Better completion
set -g fish_complete_path ~/.config/fish/completions

# Aliases for common commands
alias ll "eza -la --git"
alias la "eza -la"
alias l "eza -l"
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."


# Better cat with syntax highlighting
alias cat "bat"

# Better ls
alias ls "eza"

# Better find
alias find "fd"

# Better grep
alias grep "rg"

# Better man pages
alias man "tldr"

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    base16-google-dark
end
