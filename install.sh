#!/usr/bin/env bash
set -e

echo "Setting up vim configuration..."

# Create necessary directories
mkdir -p backup
mkdir -p bin

# Install vim-plug if not already installed
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Installing vim-plug for vim..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "vim-plug already installed for vim"
fi

# Install vim-plug for neovim if nvim is installed
if command -v nvim &> /dev/null; then
  if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]; then
    echo "Installing vim-plug for neovim..."
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo "vim-plug already installed for neovim"
  fi
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
echo "  1. Open vim/nvim (plugins will auto-install on first launch)"
echo "  2. Or manually run: vim +PlugInstall +qall"
echo ""
