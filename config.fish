# Paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Environment Variables
set -x TINTED_TMUX_OPTION_ACTIVE 1
set -x TINTED_TMUX_OPTION_ACTIVE 1

# zoxide
zoxide init fish | source

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
    base16-google-dark
end
