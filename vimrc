" trying to keep things as organized as I can
"
"
" TODO
"   hammer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                        pre setup "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set tabstop=2			                             " tabs are 2 spaces
set shiftwidth=2                               " >> goes 2 spaces
set softtabstop=2                              " auto tabs are 2 spaces
set expandtab                                  " spaces instead of tabs
set list listchars=tab:\ \ ,trail:·            " show leading and trailings spaces/tabs
set encoding=utf-8                             " default encoding to utf-8
set nocompatible                               " enable full vim mode
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         plugins  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
nmap <silent> <c-t> :CommandT<cr>
imap <silent> <c-t> <esc>:CommandT<cr>
nmap <silent> <f5> :CommandTFlush<cr>
let g:CommandTMatchWindowAtTop = 1

" ctrl-F for Ack
nmap <C-F> :Ack<space>

" ctrl-e for ConqueTerm
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction

nmap <C-e> :call StartTerm()<CR>
" ctrl-r send to console
vmap <c-r> <f9> 

" ctrl-space to toggle comments
nmap <c-space> ,c<space>
imap <c-space> <Esc>,c<space>

"ctrl-b for bufexplorer
nmap <c-b> ,be
imap <c-b> <esc>,be

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         keymaps  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"tabs
nmap H :tabp<cr>
nmap L :tabn<cr>
nmap <c-n> :tabe .<cr>

"navigate by paragraph or by word
nmap <a-j> }
nmap <a-k> {
nmap <a-h> b
nmap <a-l> e

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

"toggle search highlighting
nmap <f2> :set hls!<cr>

"debug message in ruby
autocmd FileType ruby nmap <f3> op<space>'<esc>50i#'<esc>A<cr>p<space>'<c-r>%'<cr>p<space>'<esc>50i#'<esc>

"reload .vimrc
nmap <f12> :source ~/.vimrc.local<cr>

"open .vimrc
nmap <f11> :e ~/.vimrc.local<cr>

"toggle spellcheck
nmap <f4> :set spell!<cr>

"duplicate line
nmap <silent> <c-d> mr0Dpyyp`r

"jump to front of line
nmap <silent> <c-i> I<esc>

"system copy/paste
vmap <C-y> "+y
nmap <C-p> "+p
imap <C-p> <c-o><c-p>

"windows
nmap <c-j> <c-w>j
nmap <c-h> <c-w>h
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
imap <c-j> <esc><c-w>j
imap <c-h> <esc><c-w>h
imap <c-k> <esc><c-w>k
imap <c-l> <esc><c-w>l

" why isn't it this by default??
nnoremap <s-y> y$

"resize window
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>

" ctrl-][ to increase/decrease indentation
vmap <c-]> >gv
vmap <c-[> <gv

" something is setting this to <gv
vmap <esc> <esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         stuff    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
