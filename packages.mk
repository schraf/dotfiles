# List of packages that have the same name across all supported package managers
COMMON_PKGS := vim tmux fzf lazygit fish zoxide ripgrep bat eza starship tldr btop lazydocker jq glow aichat opencode boxes

# Packages with different names depending on the package manager
# Default to brew/pacman names
FD_PKG := fd
DELTA_PKG := delta

# Overrides for apt, yum, and dnf
ifeq ($(PACKAGE_MANAGER),apt)
    FD_PKG := fd-find
    DELTA_PKG := git-delta
else ifneq ($(filter $(PACKAGE_MANAGER),yum dnf),)
    FD_PKG := fd-find
    DELTA_PKG := git-delta
endif

# The final combined list of packages to install
PACKAGE_LIST := $(COMMON_PKGS) $(FD_PKG) $(DELTA_PKG)
