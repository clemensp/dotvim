set showcmd                         " show commands in the lower right hand corner
set backupdir=~/.vim/backup         " save backups to .vim/backup
set directory=~/.vim/backup         " save .swp files to .vim/backup
filetype plugin indent on           " load the plugin and indent settings for the detected filetype
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set laststatus=2                    " always have status bar
set wildmode=list:longest,list:full " bash-like tab completion
set incsearch                       " incremental search
set hlsearch                        " highlight search results
set ignorecase                      " ignore case when searching
set smartcase                       " disable ignorecase when there are caps
set nowrap                          " turn off line wrapping
set tabstop=2                       " tabs are 2 spaces
set shiftwidth=2                    " >> goes 2 spaces
set softtabstop=2                   " auto tabs are 2 spaces
set expandtab                       " spaces instead of tabs
set list listchars=tab:\ \ ,trail:· " show leading and trailings spaces/tabs
set encoding=utf-8                  " default encoding to utf-8
set number                          " line numbers
set ruler                           " cursor position in modeline
syntax enable                           " syntax highlighting
set novisualbell                    " turn off blinking
set history=1000                    " lots of history
set linebreak                       " wrap at word
set showtabline=2                   " always show tabs
set wrap                            " word wrap
set showbreak=...                   " show ... at line break
set guioptions-=m                   " remove menu bar
set guioptions-=T                   " remove toolbar
set confirm                         " confirm save when leaving unsaved buffers
set foldlevelstart=99               " turn off default folding
set ttymouse=xterm
set vb
let mapleader=','                   " leader
let maplocalleader=',,'             " localleader

set wildignore+=node_modules

" set background=light
" set t_Co=16
" let g:solarized_termcolors=256
" colorscheme solarized               " color
colorscheme jellybeans

if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  elseif has("gui_macvim")
    set guifont=Menlo:h14
  endif

  " this is to drop all scrollbars sort of a hacky way to do it
  set guioptions+=LlRrb
  set guioptions-=LlRrb
endif

set wildignore+=node_modules


" Requirements:
" selecta: https://github.com/garybernhardt/selecta
" ag: https://github.com/ggreer/the_silver_searcher
 
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction
 
" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>t :call SelectaCommand("ag --no-numbers --nogroup -l .", "", ":e")<cr>

" Find all files in all non-dot directories starting in the working directory.
" " Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
