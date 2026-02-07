call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'srstevenson/vim-picker'

" Editing
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'travisjeffery/vim-jump-x2'
Plug 'Lokaltog/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'AndrewRadev/switch.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'mikbe/rspec.vim'
Plug 'ngmy/vim-rubocop'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'

" CSS
Plug 'hail2u/vim-css3-syntax'

" Linting & code quality
Plug 'dense-analysis/ale'

" Search
Plug 'rking/ag.vim'

" UI
Plug 'bling/vim-airline'

" Project management
Plug 'tpope/vim-projectionist'

" YAML
Plug 'Einenlum/yaml-revealer'

call plug#end()
