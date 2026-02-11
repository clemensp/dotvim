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

# Create nvim init.vim symlink (if nvim is installed)
if command -v nvim &> /dev/null; then
  mkdir -p "$HOME/.config/nvim"
  if [ ! -L "$HOME/.config/nvim/init.vim" ]; then
    echo "Creating symlink ~/.config/nvim/init.vim -> ~/.vimrc"
    ln -sf "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
  else
    echo "~/.config/nvim/init.vim symlink already exists"
  fi
fi

# Set up nvim as default vim (if nvim is installed)
if command -v nvim &> /dev/null; then
  SHELL_RC=""

  # Detect shell config file based on user's login shell
  case "$SHELL" in
    */zsh)
      SHELL_RC="$HOME/.zshrc"
      ;;
    */bash)
      SHELL_RC="$HOME/.bashrc"
      ;;
  esac

  if [ -n "$SHELL_RC" ] && [ -f "$SHELL_RC" ]; then
    if ! grep -q "alias vim.*nvim" "$SHELL_RC"; then
      echo "" >> "$SHELL_RC"
      echo "# Use neovim as vim" >> "$SHELL_RC"
      echo 'export EDITOR="nvim"' >> "$SHELL_RC"
      echo 'alias vim="nvim"' >> "$SHELL_RC"
      echo 'alias vi="nvim"' >> "$SHELL_RC"
      echo "Added vim→nvim aliases to $SHELL_RC"
    else
      echo "vim→nvim aliases already configured"
    fi
  fi
fi

echo ""
echo "Setup complete!"
echo ""
echo "Next step:"
echo "  Install plugins: vim +PlugInstall +qall"
echo ""
