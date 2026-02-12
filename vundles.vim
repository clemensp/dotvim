call plug#begin('~/.vim/plugged')

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'Lokaltog/vim-easymotion'
Plug 'AndrewRadev/switch.vim'

if !exists('g:vscode')
  " File navigation
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'srstevenson/vim-picker'

  " Editing (UI-dependent)
  Plug 'nathanaelkane/vim-indent-guides'

  " Ruby
  Plug 'vim-ruby/vim-ruby'

  " Linting & code quality
  Plug 'dense-analysis/ale'
endif

call plug#end()
