#!/usr/bin/env bash
set -e

echo "Setting up vim configuration..."

# Create necessary directories
mkdir -p bundle
mkdir -p backup
mkdir -p bin

# Install Vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  echo "Installing Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
  echo "Vundle already installed"
fi

# Create symlink to vimrc
if [ ! -L "$HOME/.vimrc" ]; then
  echo "Creating symlink ~/.vimrc -> ~/.vim/vimrc"
  ln -sf "$HOME/.vim/vimrc" "$HOME/.vimrc"
else
  echo "~/.vimrc symlink already exists"
fi

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Open vim/nvim"
echo "  2. Run :PluginInstall to install all plugins"
echo ""
