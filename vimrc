set nocompatible

if !has('nvim')
  set term=builtin_ansi
endif

filetype off

" vundle
source ~/.vim/vundles.vim

" configure vim settings
source ~/.vim/settings.vim

" configure plugins
source ~/.vim/plugin-config.vim

" set up autocmds
source ~/.vim/autocmds.vim

" set up modeline
" source ~/.vim/statusline.vim
