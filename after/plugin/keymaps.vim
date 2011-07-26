" Make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

"run test
map <F12> :silent execute "!ruby % &> /tmp/vim.log &" <cr>

" Hit escape to clear a search
:nnoremap <esc> :noh<return><esc>

"toggle taglist
map <F4> :TlistToggle<cr>

"reload ctags
nmap <F8> :!ctags -R .<cr>

"turn off search highlighting
nnoremap <esc> :noh<return><esc>

"duplicate line
nmap <silent> <c-d> mr0Dpyyp`r

" reclaiming some plugin mappings
vnoremap <esc> <esc>

if has("gui_macvim")
endif

if has("gui_gtk2")
endif
