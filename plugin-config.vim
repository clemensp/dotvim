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
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }
let g:syntastic_javascript_checkers = ['eslint']

" jump-x2
nmap <left> <Plug>(jump-x2-to-previous)
nmap <right> <Plug>(jump-x2-to-next)

"toggle taglist
map <F4> :TlistToggle<cr>

let g:rails_path_additions = ['domain/common', 'domain/integration', 'domain/invoicing', 'domain/picking',
            \'domain/production', 'domain/quickbooks', 'domain/reports', 'domain/true_efficiency', 'domain/icg',
            \'domain/inventory', 'domain/master', 'domain/planning', 'domain/quality', 'domain/quoting',
            \'domain/shipping_receiving', 'domain/wms']

nnoremap <Leader>t :call PickFile()<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" vim-airline
let g:airline_theme='oceanicnext'
