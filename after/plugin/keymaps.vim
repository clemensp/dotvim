" Make j/k move to next visual line instead of physical line
" http://yubinkim.com/?p=6
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

"reload ctags
nmap <F8> :!ctags -R .<cr>

" Tabular
nmap <Leader>a :Tab/\|<CR>
vmap <Leader>a :Tab/\|<CR>

" "duplicate line
" nmap <silent> <c-d> mr0Dpyyp`r
" 
" reclaiming some plugin mappings
vnoremap <esc> <esc>
