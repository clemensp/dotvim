:runtime macros/matchit.vim

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


" jump-x2
nmap <left> <Plug>(jump-x2-to-previous)
nmap <right> <Plug>(jump-x2-to-next)

nmap <unique> <leader>t <Plug>(PickerEdit)
nmap <unique> <leader>b <Plug>(PickerBuffer)
nmap <unique> <leader>] <Plug>(PickerTag)

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

nmap <Leader>cr :call system("pbcopy", expand("%"))<CR>
nmap <Leader>cp :call system("pbcopy", expand("%:p"))<CR>
nmap <Leader>cf :call system("pbcopy", expand("%:t"))<CR>
