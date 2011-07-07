" enable full vim mode
set nocompatible

"pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" configure vim settings
source "settings.vim"

" configure plugins
source "plugin-config.vim"

" set up autocmds
source "autocmds.vim"

" set up modeline
source "statusline.vim"
