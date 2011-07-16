" enable full vim mode
set nocompatible

"pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" configure vim settings
source ~/.vim/settings.vim

" configure plugins
source ~/.vim/plugin-config.vim

" set up autocmds
source ~/.vim/autocmds.vim

" set up modeline
source ~/.vim/statusline.vim

" auto highlight current word
source ~/.vim/auto-highlight.vim
