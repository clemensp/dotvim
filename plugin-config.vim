:runtime macros/matchit.vim

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" ,n for NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nmap <Leader>nn :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>

" ALE
let g:ale_fixers = {
    \    'ruby': ['rubocop'],
    \}
" let g:ale_fix_on_save = 1
highlight ALEWarning ctermbg=DarkGrey

" Rubocop autocorrect
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
endfunction

map <silent> <Leader>cop :call RubocopAutocorrect()<cr>


nmap <unique> <leader>t <Plug>(PickerEdit)
nmap <unique> <leader>b <Plug>(PickerBuffer)
nmap <unique> <leader>] <Plug>(PickerTag)

nmap <Leader>cr :call system("pbcopy", expand("%"))<CR>
nmap <Leader>cp :call system("pbcopy", expand("%:p"))<CR>
nmap <Leader>cf :call system("pbcopy", expand("%:t"))<CR>
