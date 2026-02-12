call plug#begin('~/.vim/plugged')

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'srstevenson/vim-picker'

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'Lokaltog/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'AndrewRadev/switch.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Linting & code quality
Plug 'dense-analysis/ale'

call plug#end()
