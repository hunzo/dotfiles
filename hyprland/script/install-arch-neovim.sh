#!/bin/bash
# install list
# - Golang
# - Python
# - Python-venv
# - Node Version Manager (nvm)

GO_VERSION=go1.25.1
NVIM_VERSION=v0.11.5
NVIM_FILE_NAME=nvim-linux-x86_64
NVM_VERSION=v0.40.3

# -- clean old Go
# echo "Removing old Go installation in ~/.go and ~/.sdk/go ..."
# sudo rm -rf ~/.go
# sudo rm -rf ~/.sdk/go
# sudo rm -f $GO_VERSION.linux-amd64.tar.gz

# -- remove system-wide Go if exists (optional)
sudo rm -rf /usr/local/go
sudo rm -f /usr/bin/go

# -- install golang
echo "Downloading Go $GO_VERSION ..."
curl -OL https://golang.org/dl/$GO_VERSION.linux-amd64.tar.gz

mkdir -p ~/.go-sdk
mkdir -p ~/.go-pkg

echo "Extracting Go ..."
tar xzvf $GO_VERSION.linux-amd64.tar.gz -C ~/.go-sdk

# -- set go env in bashrc
if ! grep -q 'export GOROOT=\$HOME/.go-sdk/go' ~/.bashrc; then
  cat <<EOF | tee -a ~/.bashrc
export GOPATH=\$HOME/.go-pkg
export GOROOT=\$HOME/.go-sdk/go
export GOBIN=\$GOPATH/bin
export PATH=\$GOROOT/bin:\$GOBIN:\$PATH
EOF
fi

rm -f $GO_VERSION.linux-amd64.tar.gz

# -- set shell .bashrc (prompt)
echo "set shell .bashrc (prompt)"
if ! grep -q 'show_git_branch()' ~/.bashrc; then
  cat <<EOF | tee -a ~/.bashrc
show_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}
# export PS1='\[\e[38;5;214m\]\w \[\e[91m\]\$(show_git_branch)\[\e[m\]\[\033[32m\]❱\[\e[m\] '
EOF
fi

# -- clear old neovim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
sudo rm -rf /usr/bin/nvim*

# -- add .bashrc (nvim as default editor)
echo "add .bashrc (nvim as default editor)"
if ! grep -q 'export EDITOR=nvim' ~/.bashrc; then
  cat <<EOF | tee -a ~/.bashrc
export EXPORT EDITOR=nvim
alias vim=nvim
set -o vi
EOF
fi

# -- install neovim
echo "Installing Neovim $NVIM_VERSION ..."
curl -OL https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/$NVIM_FILE_NAME.tar.gz

sudo rm -f /usr/bin/nvim
sudo tar xzvf $NVIM_FILE_NAME.tar.gz -C /usr/bin/
sudo ln -sf /usr/bin/$NVIM_FILE_NAME/bin/nvim /usr/bin/nvim
rm -f $NVIM_FILE_NAME.tar.gz

# -- install nvm and nodejs
echo "Installing nvm $NVM_VERSION ..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
source ~/.bashrc
nvm install --lts

# -- install ansible

sudo pacman -Syu || echo "Failed to update apt after adding PPA."
sudo pacman -S ansible --noconfirm || echo "Failed to install Ansible."

echo "Setup completed successfully!"
