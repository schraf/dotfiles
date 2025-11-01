# Dotfiles Makefile
# This Makefile replaces install.sh and mac_install.sh
# Works on both macOS and Linux

# Detect operating system
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    OS := macos
    PACKAGE_MANAGER := brew
else
    OS := linux
    # Detect Linux package manager
    ifneq ($(shell which apt),)
        PACKAGE_MANAGER := apt
    else ifneq ($(shell which yum),)
        PACKAGE_MANAGER := yum
    else ifneq ($(shell which dnf),)
        PACKAGE_MANAGER := dnf
    else ifneq ($(shell which pacman),)
        PACKAGE_MANAGER := pacman
    else
        PACKAGE_MANAGER := unknown
    endif
endif

.PHONY: help install deps deps-macos deps-linux setup-dirs copy-configs install-tpm clean

# Default target
help:
	@echo "Available targets:"
	@echo "  install      - Install everything (deps + setup + copy configs)"
	@echo "  deps         - Install dependencies (auto-detects OS and package manager)"
	@echo "  deps-macos   - Install dependencies via brew (macOS)"
	@echo "  deps-linux   - Install dependencies via apt/yum/dnf/pacman (Linux)"
	@echo "  setup-dirs   - Create necessary directories"
	@echo "  copy-configs - Copy configuration files"
	@echo "  install-tpm  - Install tmux plugin manager"
	@echo "  clean        - Remove installed files (use with caution)"
	@echo ""
	@echo "Detected OS: $(OS)"
	@echo "Package manager: $(PACKAGE_MANAGER)"

# Install everything
install: deps setup-dirs copy-configs install-tpm
	@echo "Installation complete!"

# Install dependencies (auto-detect OS)
deps:
ifeq ($(OS),macos)
	@$(MAKE) deps-macos
else
	@$(MAKE) deps-linux
endif

# Install dependencies via brew (macOS)
deps-macos:
	@echo "Installing dependencies via brew (macOS)..."
	brew install vim tmux fzf lazygit fish zoxide ripgrep fd bat eza delta starship tldr btop lazydocker jq glow

# Install dependencies via Linux package managers
deps-linux:
	@echo "Installing dependencies via $(PACKAGE_MANAGER) (Linux)..."
ifeq ($(PACKAGE_MANAGER),apt)
	sudo apt update
	sudo apt install -y vim tmux fzf lazygit fish zoxide ripgrep fd-find bat eza git-delta starship tldr btop lazydocker jq glow
else ifeq ($(PACKAGE_MANAGER),yum)
	sudo yum install -y vim tmux fzf lazygit fish zoxide ripgrep fd-find bat eza git-delta starship tldr btop lazydocker jq glow
else ifeq ($(PACKAGE_MANAGER),dnf)
	sudo dnf install -y vim tmux fzf lazygit fish zoxide ripgrep fd-find bat eza git-delta starship tldr btop lazydocker jq glow
else ifeq ($(PACKAGE_MANAGER),pacman)
	sudo pacman -S --noconfirm vim tmux fzf lazygit fish zoxide ripgrep fd bat eza delta starship tldr btop lazydocker jq glow
else
	@echo "Error: Unknown package manager: $(PACKAGE_MANAGER)"
	@echo "Please install the following packages manually:"
	@echo "  vim tmux fzf lazygit fish zoxide ripgrep fd bat eza delta starship tldr btop lazydocker jq glow"
	@exit 1
endif

# Create necessary directories
setup-dirs:
	@echo "Creating directories..."
	mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo ~/.vim/colors
	mkdir -p ~/.config/fish
	mkdir -p ~/.fzf/plugin
	mkdir -p ~/.config/btop/themes

# Copy configuration files
copy-configs: setup-dirs
	@echo "Copying configuration files..."
	cp vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
	cp config.fish ~/.config/fish
	cp -R base16/base16-shell ~/.config/base16-shell
	cp base16/base16-vim/colors/*.vim ~/.vim/colors
	cp fzf.vim ~/.fzf/plugin
	cp starship.toml ~/.config/starship.toml
	cp btop.conf ~/.config/btop
	cp btop.theme ~/.config/btop/themes

# Install tmux plugin manager
install-tpm:
	@echo "Installing tmux plugin manager..."
	@if [ ! -d "$$HOME/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm $$HOME/.tmux/plugins/tpm; \
	else \
		echo "tmux plugin manager already installed"; \
	fi

# Clean up installed files (use with caution)
clean:
	@echo "Cleaning up installed files..."
	@echo "This will remove:"
	@echo "  - ~/.vimrc"
	@echo "  - ~/.tmux.conf"
	@echo "  - ~/.config/fish/config.fish"
	@echo "  - ~/.config/base16-shell/"
	@echo "  - ~/.vim/colors/"
	@echo "  - ~/.fzf/plugin/fzf.vim"
	@echo "  - ~/.tmux/plugins/tpm/"
	@echo "  - ~/.config/starship.toml"
	@echo "  - ~/.config/btop"
	@read -p "Are you sure? (y/N): " confirm && [ "$$confirm" = "y" ] || exit 1
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -f ~/.config/fish/config.fish
	rm -rf ~/.config/base16-shell
	rm -rf ~/.vim/colors
	rm -f ~/.fzf/plugin/fzf.vim
	rm -rf ~/.tmux/plugins/tpm
	rm -f ~/.config/starship.toml
	rm -rf ~/.config/btop
	@echo "Cleanup complete!"
