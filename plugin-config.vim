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

"syntastic
" let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"nu-"]
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map={ 'mode': 'active',
      \ 'active_filetypes': ['js'],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_sass_args="--load-path app/assets/stylesheets --ignore='import'"
let g:syntastic_sass_sass_args="--load-path app/assets/stylesheets --ignore='import'"
let g:syntastic_css_scss_args="--load-path app/assets/stylesheets --ignore='import'"

" jump-x2
nmap <left> <Plug>(jump-x2-to-previous)
nmap <right> <Plug>(jump-x2-to-next)

nmap <unique> <leader>t <Plug>PickerEdit
nmap <unique> <leader>b <Plug>PickerBuffer
nmap <unique> <leader>] <Plug>PickerTag

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" vim-airline
let g:airline_theme='oceanicnext'

let g:ycm_server_python_interpreter='/usr/bin/python'

nmap <Leader>cr :call system("pbcopy", expand("%"))<CR>
nmap <Leader>cp :call system("pbcopy", expand("%:p"))<CR>
nmap <Leader>cf :call system("pbcopy", expand("%:t"))<CR>
