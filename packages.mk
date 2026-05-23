# List of packages that have the same name across all supported package managers
COMMON_PKGS := vim tmux fzf lazygit fish zoxide ripgrep bat eza starship btop lazydocker jq glow opencode boxes fastmod

# Packages with different names depending on the package manager
# Default to brew/pacman names
FD_PKG := fd

# Overrides for apt, yum, and dnf
ifeq ($(PACKAGE_MANAGER),apt)
    FD_PKG := fd-find
else ifneq ($(filter $(PACKAGE_MANAGER),yum dnf),)
    FD_PKG := fd-find
endif

# The final combined list of packages to install
PACKAGE_LIST := $(COMMON_PKGS) $(FD_PKG) 
