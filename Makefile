# Dotfiles Makefile

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

# Include package definitions
include packages.mk

# Define installation commands
ifeq ($(PACKAGE_MANAGER),brew)
    INSTALL_CMD := brew install
else ifeq ($(PACKAGE_MANAGER),apt)
    INSTALL_CMD := sudo apt update && sudo apt install -y
else ifeq ($(PACKAGE_MANAGER),pacman)
    INSTALL_CMD := sudo pacman -S --noconfirm
else ifneq ($(filter $(PACKAGE_MANAGER),yum dnf),)
    INSTALL_CMD := sudo $(PACKAGE_MANAGER) install -y
endif

.PHONY: help install deps setup-dirs copy-configs install-tpm install-workmux clean

# Default target
help:
	@echo "Available targets:"
	@echo "  install      - Install everything (deps + setup + copy configs)"
	@echo "  deps         - Install dependencies (auto-detects OS and package manager)"
	@echo "  setup-dirs   - Create necessary directories"
	@echo "  copy-configs - Copy configuration files"
	@echo "  clean        - Remove installed files (use with caution)"
	@echo ""
	@echo "Detected OS: $(OS)"
	@echo "Package manager: $(PACKAGE_MANAGER)"

# Install everything
install: deps setup-dirs copy-configs install-tpm install-workmux
	@echo "Installation complete!"

# Install dependencies
deps:
	@if [ "$(PACKAGE_MANAGER)" = "unknown" ]; then \
		echo "Error: Unknown package manager. Please install manually:"; \
		echo "  $(PACKAGE_LIST)"; \
		exit 1; \
	fi
	@echo "Installing dependencies via $(PACKAGE_MANAGER)..."
	$(INSTALL_CMD) $(PACKAGE_LIST)

# Create necessary directories
setup-dirs:
	@echo "Creating directories..."
	mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo ~/.vim/pack/bundle/start
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/btop/themes

# Copy configuration files
copy-configs: setup-dirs
	@echo "Copying configuration files..."
	cp vim/vimrc ~/.vimrc
	cp tmux.conf ~/.tmux.conf
	cp config.fish ~/.config/fish
	cp -R base16/base16-shell ~/.config/base16-shell
	cp -R vim/pack ~/.vim/
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

# Install workmux
install-workmux:
	@echo "Installing workmux..."
	@if command -v workmux >/dev/null 2>&1; then \
		echo "workmux already installed ($$(command -v workmux))"; \
	else \
		curl -fsSL https://raw.githubusercontent.com/raine/workmux/main/scripts/install.sh | bash; \
	fi
	

# Clean up installed files (use with caution)
clean:
	@echo "Cleaning up installed files..."
	@echo "This will remove:"
	@echo "  - ~/.vimrc"
	@echo "  - ~/.tmux.conf"
	@echo "  - ~/.config/fish/config.fish"
	@echo "  - ~/.config/base16-shell/"
	@echo "  - ~/.vim/pack/bundle/"
	@echo "  - ~/.tmux/plugins/tpm/"
	@echo "  - ~/.config/starship.toml"
	@echo "  - ~/.config/btop"
	@read -p "Are you sure? (y/N): " confirm && [ "$$confirm" = "y" ] || exit 1
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf
	rm -f ~/.config/fish/config.fish
	rm -rf ~/.config/base16-shell
	rm -rf ~/.vim/pack/bundle
	rm -rf ~/.tmux/plugins/tpm
	rm -f ~/.config/starship.toml
	rm -rf ~/.config/btop
	@echo "Cleanup complete!"
