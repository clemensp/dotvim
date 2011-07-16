" quickfix nav
nmap <a-left> :cp<cr>
nmap <a-right> :cn<cr>

" ctrl-space to toggle comment
nmap <c-space> ,c<space>
vmap <c-space> ,c<space>

"c-backspace to delete word
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

" Hit escape to clear a search
:nnoremap <esc> :noh<return><esc>

"tabs
nmap H :tabp<cr>
nmap L :tabn<cr>
nmap <c-t> :tabe .<cr>

"navigate by paragraph or by word
nmap <c-j> }
nmap <c-k> {
nmap <c-h> b
nmap <c-l> e

"for Gdiff
nmap <left> :diffget //3 | :diffupdate
nmap <right> :diffget //2 | :diffupdate
nmap <up> ]c
nmap <down> [c

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

" reclaiming some plugin mappings
vnoremap <esc> <esc>

" kill some maps
unmap \\
unmap \/

if has("gui_macvim")
  nmap <d-j> <c-w><c-w>
endif

if has("gui_gtk2")
  " select all
  nmap <silent> <a-a> GVgg

  " cycle active split
  nmap <a-j> <c-w><c-w>

  " system copy/paste
  vmap <a-c> "+y
  nmap <a-v> "+p
  nmap <a-x> "+d
  imap <a-p> <c-o><a-v>

  unmap ,w=
endif
