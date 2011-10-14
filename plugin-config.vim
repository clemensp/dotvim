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

" ,n for NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nmap <Leader>n :NERDTreeToggle<CR>

" Command-t
let g:CommandTMaxHeight=20
map <Leader>f :CommandTFlush<CR>

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Testerical
let g:testerical_cmd_test = "bundle exec ruby %p"
let g:testerical_cmd_testcase = "bundle exec ruby %p -n '/%c/'"

" jump-x2
nmap <left> <Plug>(jump-x2-to-previous)
nmap <right> <Plug>(jump-x2-to-next)

" Unite
nmap <Leader>s :Unite file<CR>
nmap <Leader>b :Unite buffer<CR>

"toggle taglist
map <F4> :TlistToggle<cr>
