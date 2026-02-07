set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Core
Plugin 'VundleVim/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'

" File navigation
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'srstevenson/vim-picker'

" Editing
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'travisjeffery/vim-jump-x2'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'AndrewRadev/switch.vim'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'mikbe/rspec.vim'
Plugin 'ngmy/vim-rubocop'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'

" CSS
Plugin 'hail2u/vim-css3-syntax'

" Linting & code quality
Plugin 'dense-analysis/ale'

" Search
Plugin 'rking/ag.vim'

" UI
Plugin 'bling/vim-airline'

" Project management
Plugin 'tpope/vim-projectionist'

" YAML
Plugin 'Einenlum/yaml-revealer'

call vundle#end()
