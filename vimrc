set nocompatible
filetype off

" vundle
source ~/.vim/vundles.vim

if filereadable($HOME . "/.vim/.plugins_installed")
  " configure vim settings
  source ~/.vim/settings.vim

  " configure plugins
  source ~/.vim/plugin-config.vim

  " set up autocmds
  source ~/.vim/autocmds.vim

  " set up modeline
  source ~/.vim/statusline.vim
endif
