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
nmap <Leader>n :NERDTreeToggle<CR>

" Command-t
let g:CommandTMaxHeight=20
let g:CommandTMaxFiles=50000
map <Leader>f :CommandTFlush<CR>

"syntastic
" let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-", " proprietary attribute \"nu-"]
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map={ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['html'] }

" Testerical
" let g:testerical_cmd_test = "bundle exec ruby %p"
" let g:testerical_cmd_testcase = "bundle exec ruby %p -n '/%c/'"
" let g:testerical_in_spork = 1

" Turbux
"nmap <leader>rT <Plug>SendTestToTmux
"nmap <leader>rt <Plug>SendFocusedTestToTmux

" jump-x2
nmap <left> <Plug>(jump-x2-to-previous)
nmap <right> <Plug>(jump-x2-to-next)

"toggle taglist
map <F4> :TlistToggle<cr>


let g:rails_path_additions = ['domain/common', 'domain/integration', 'domain/invoicing', 'domain/picking',
            \'domain/production', 'domain/quickbooks', 'domain/reports', 'domain/true_efficiency', 'domain/icg',
            \'domain/inventory', 'domain/master', 'domain/planning', 'domain/quality', 'domain/quoting',
            \'domain/shipping_receiving', 'domain/wms']

autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal columns=80
autocmd Filetype markdown setlocal textwidth=0
autocmd Filetype markdown setlocal wrapmargin=0
