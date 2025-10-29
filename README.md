# Dotfiles

A collection of my personal dotfiles and development environment configuration. This setup provides a modern, efficient development environment with consistent theming and useful tools.

## Quick Start

```bash
# Clone the repository
git clone https://github.com/schraf/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install everything (dependencies + configuration)
make install
```

## What's Included

### Core Tools
- **Fish Shell** - Modern shell with better defaults
- **Vim** - Text editor with sensible configuration
- **tmux** - Terminal multiplexer with plugins
- **fzf** - Fuzzy finder for everything
- **zoxide** - Smarter cd command

### Enhanced Tools
- **bat** - Better cat with syntax highlighting
- **eza** - Modern ls replacement with git integration
- **ripgrep** - Faster grep alternative
- **fd** - Better find command
- **delta** - Better git diff viewer
- **starship** - Modern shell prompt
- **tldr** - Better man pages
- **lazygit** - Terminal-based git UI
- **lazydocker** - Terminal-based docker UI
- **btop** - Better top

### Theming
- **Base16** - Consistent color scheme across shell and vim
- **Google Dark** theme by default

## Configuration Files

| File | Description |
|------|-------------|
| `config.fish` | Fish shell configuration with aliases and history settings |
| `vimrc` | Vim configuration with sensible defaults and backup settings |
| `tmux.conf` | tmux configuration with plugins and better copy mode |
| `starship.toml` | Modern shell prompt configuration |
| `fzf.vim` | fzf integration for vim |
| `base16/` | Base16 theming system for shell and vim |
| `btop.conf` | btop configuration with theme |

## Key Features

### Fish Shell
- **History**: 10,000 command history with persistent storage
- **Aliases**: Useful shortcuts for common commands
- **Modern prompt**: Starship integration with git info and directory display
- **Smart navigation**: zoxide for intelligent directory jumping

### Vim
- **Sensible defaults**: Modern vim configuration
- **Better backup**: Preserves directory structure in backup/swap files
- **fzf integration**: Fuzzy file finding with `<C-p>`
- **Consistent theming**: Base16 Google Dark theme

### tmux
- **Modern prefix**: `Ctrl+Space` instead of `Ctrl+b`
- **Better copy mode**: Vi-style copy with system clipboard integration
- **Plugin management**: TPM for easy plugin installation
- **Consistent theming**: Base16 integration


## Installation

### Prerequisites
- macOS (Homebrew) or Linux (apt/yum/dnf/pacman)
- Git

### Automated Installation
```bash
# Install everything
make install

# Or install components separately
make deps          # Install dependencies only
make copy-configs  # Copy configuration files only
make install-tpm   # Install tmux plugin manager
```

## Aliases

### File Operations
```bash
ll      # eza -la --git (detailed list with git status)
la      # eza -la (detailed list)
l       # eza -l (list)
..      # cd ..
...     # cd ../..
....    # cd ../../..
```

### Tool Replacements
```bash
cat     # bat (syntax highlighted cat)
ls      # eza (modern ls)
find    # fd (better find)
grep    # rg (ripgrep)
man     # tldr (better man pages)
```

## Customization

### Changing Theme
Edit `config.fish` and change the base16 theme:
```fish
base16-google-dark  # Change to your preferred theme
```

Available themes in `base16/base16-shell/scripts/`:
- `base16-google-dark` (default)
- `base16-solarized-dark`
- `base16-gruvbox-dark`
- And many more...

### Adding Aliases
Add custom aliases to `config.fish`:
```fish
alias myalias "command --options"
```

### Vim Customization
Modify `vimrc` for vim-specific settings:
- Key mappings
- Plugin configurations
- Filetype-specific settings

## Maintenance

### Update Dependencies
```bash
# macOS
brew update && brew upgrade

# Linux
sudo apt update && sudo apt upgrade
```

### Clean Installation
```bash
make clean  # Remove all installed files (use with caution)
```

### Backup Current Config
```bash
# Backup existing configuration before installing
cp ~/.vimrc ~/.vimrc.backup
cp ~/.tmux.conf ~/.tmux.conf.backup
cp ~/.config/fish/config.fish ~/.config/fish/config.fish.backup
```

## Troubleshooting

### Fish Shell Issues
- Ensure fish is in your `/etc/shells` file
- Check that starship is installed: `which starship`

### Vim Issues
- Verify backup directories exist: `mkdir -p ~/.vim/{backup,swap,undo}`
- Check fzf installation: `which fzf`

### tmux Issues
- Install TPM plugins: `prefix + I` in tmux
- Verify tmux version: `tmux -V` (requires 1.7+)


## Directory Structure

```
dotfiles/
├── README.md
├── Makefile
├── config.fish          # Fish shell configuration
├── btop.conf            # btop configuration
├── btop.theme           # btop theme
├── vimrc                # Vim configuration
├── tmux.conf            # tmux configuration
├── starship.toml        # Starship prompt configuration
├── fzf.vim              # fzf vim integration
└── base16/              # Base16 theming
    ├── base16-shell/    # Shell themes
    └── base16-vim/      # Vim themes
```

## Contributing

Feel free to fork this repository and customize it for your needs. If you have improvements or suggestions, please open an issue or submit a pull request.

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- [Base16](https://github.com/chriskempson/base16) for theming
- [Starship](https://starship.rs/) for the modern prompt
- [fzf](https://github.com/junegunn/fzf) for fuzzy finding
- [tmux-plugins](https://github.com/tmux-plugins) for tmux enhancements
