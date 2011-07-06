""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                        pre setup "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable full vim mode
set nocompatible

"pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         setup    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd                                    " show commands in the lower right hand corner
set backupdir=~/.vim/backup                    " save backups to .vim/backup
set directory=~/.vim/backup                    " save .swp files to .vim/backup
filetype plugin indent on                      " load the plugin and indent settings for the detected filetype
set backspace=indent,eol,start                 " allow backspacing over everything in insert mode
set laststatus=2                               " always have status bar
set wildmode=list:longest,list:full            " bash-like tab completion
set incsearch                                  " incremental search
set ignorecase                                 " ignore case when searching
set smartcase                                  " disable ignorecase when there are caps
set nowrap                                     " turn off line wrapping
set tabstop=2                                  " tabs are 2 spaces
set shiftwidth=2                               " >> goes 2 spaces
set softtabstop=2                              " auto tabs are 2 spaces
set expandtab                                  " spaces instead of tabs
set list listchars=tab:\ \ ,trail:·            " show leading and trailings spaces/tabs
set encoding=utf-8                             " default encoding to utf-8
set number                                     " line numbers
set ruler                                      " cursor position in modeline
syntax on                                      " syntax highlighting
set novisualbell                               " turn off blinking
set history=1000                               " lots of history
set linebreak                                  " wrap at word
set showtabline=2                              " always show tabs
set wrap                                       " word wrap
set showbreak=...                              " show ... at line break
set guioptions-=m                              " remove menu bar
set guioptions-=T                              " remove toolbar
set confirm                                    " confirm save when leaving unsaved buffers
set foldlevelstart=99                          " turn off default folding
let mapleader=','                              " leader
let maplocalleader=',,'                        " localleader
colorscheme blackboard                         " color

" this is to drop all scrollbars sort of a hacky way to do it
set guioptions+=LlRrb
set guioptions-=LlRrb

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         plugins  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fugitive

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" fugitive buffers when we
" leave them - otherwise the buffer list gets poluted
" add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


" CTags
nmap <C-F5> :!ctags --extra=+f -R *<CR><CR>
nmap <C-\> :tnext<CR>

" ,, to ZoomWin
nmap <Leader><Leader> :ZoomWin<CR>

" ,n for NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nmap <Leader>n :NERDTreeToggle<CR>

" Command-t
let g:CommandTMaxHeight=20
nmap <silent> <a-t> :CommandT<cr>
imap <silent> <a-t> <esc>:CommandT<cr>
nmap <silent> <f5> :CommandTFlush<cr>
let g:CommandTMatchWindowAtTop = 1

" ctrl-F for Ack
nmap <C-F> :Ack<space>

" ctrl-e for ConqueTerm
function! StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction
" Press ? for help             |  1 require 'spec_helper'
                               |  2
.
nmap <C-e> :call StartTerm()<CR>
" ctrl-r send to console
vmap <c-r> <f9> 

" ctrl-space to toggle comments
nmap <c-space> ,c<space>
au VimEnter * vmap <c-space> ,c<space>

"ctrl-b for bufexplorer
nmap <c-b> ,be
imap <c-b> <esc>,be

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

",p for hammer
nmap <Leader>p :Hammer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         keymaps  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c-backspace
imap <C-BS> <C-W>
cmap <C-BS> <C-W>

"map \ to q:
nmap \ q:i

"run test
nmap ,rt :silent execute "!ruby % &> /tmp/testlog &"<cr>
nmap ,rs :silent execute "!rspec --color % &> /tmp/testlog &"<cr>
nmap ,rl :silent execute "!gnome-terminal --geometry 110x60 -e 'tail -f /tmp/testlog' &"<cr>
" nmap ,rl :VimShellExecute tail -f /tmp/testlog<cr><c-w>l
" nmap ,rt :VimShellExecute ruby <c-r>%<cr>

"tabs
nmap H :tabp<cr>
nmap L :tabn<cr>
nmap <c-t> :tabe .<cr>

"navigate by paragraph or by word
nmap <c-j> }
nmap <c-k> {
nmap <c-h> b
nmap <c-l> e

"select all
nmap <silent> <c-a> GVgg

" E edits from the local dir
nmap E :e <C-R>=expand("%:p:h") . "/" <CR>

"new line, but stay in command mode
nmap <c-return> o<esc>k

"visual replace
vmap <silent> r "_dP

"reload ctags
nmap <c-f5> :!ctags -R .<cr>

"ctrl-tab toggles last file
nmap <c-tab> <c-6>

"toggle search highlighting
nmap <f2> :set hls!<cr>

"reload .vimrc
nmap <f12> :source ~/.vimrc<cr>

"open .vimrc
nmap <f11> :e ~/.vimrc<cr>

"toggle spellcheck
nmap <f4> :set spell!<cr>

"duplicate line
nmap <silent> <c-d> mr0Dpyyp`r

"jump to front of line
nmap <silent> <c-i> I<esc>

" why isn't it this by default??
nnoremap <s-y> y$

"resize window
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>

" kill all buffers
nmap <c-q> :bufdo bd

" ,so to source current file
nmap <Leader>so :so %<cr>

" c-; goes back a jump
nnoremap <c-;> ,


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       OS         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" OSX<----------------------------------
"cycle active split
" nmap <d-j> <c-w><c-w>


" linux<----------------------------------
" cycle active split
nmap <a-j> <c-w><c-w>

" system copy/paste
vmap <a-c> +y
nmap <a-v> +p
nmap <a-x> +d
imap <a-p> <c-o><a-v>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                ruby debugging    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ,tp to add .tap &method(:puts) to a line
autocmd FileType ruby nmap <Leader>tp mpA.tap &method(:puts)<esc>`p

" ,apc to puts the line and copy it
autocmd FileType ruby nmap <Leader>apc mpyypkIap(<esc>A)<esc>`p3l

" ,ap<space> to puts the line
autocmd FileType ruby nmap <Leader>ap<space> mpIap(<esc>A)<esc>`p3l


"debug message in ruby
autocmd FileType ruby nmap <Leader>db op<space>'<esc>50i#'<esc>A<cr>p<space>'<c-r>%'<cr>p<space>'<esc>50i#'<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         stuff    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" setup statusline
source ~/.vim/statusline.vim

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       functions  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  set ft=markdown
endfunction
