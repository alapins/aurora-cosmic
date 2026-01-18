#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#dnf5 install -y tmux 

# Use a COPR Example:
#
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y install cosmic-desktop

dnf5 -y copr enable scottames/ghostty
dnf5 -y install ghostty
dnf5 -y install nushell
dnf5 -y install lazygit
dnf5 -y install lazydocker
dnf5 -y install carapace
dnf5 -y install bat
dnf5 -y install dust
dnf5 -y install yazi
dnf5 -y install neovim

# Install nix
# curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install ostree --no-confirm --persistence=/var/lib/nix   

# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File
systemctl disable sddm.service
systemctl enable cosmic-greeter.service



systemctl enable podman.socket
