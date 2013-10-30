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
"let g:CommandTMaxHeight=20
"map <Leader>f :CommandTFlush<CR>

" CtrlP
" map <Leader>t :CtrlP<CR>
" map <Leader>f :CommandTFlush<CR>

" asyncfinder
" map <Leader>t :AsyncFinder<CR>
" let g:asyncfinder_include_buffers="0"
" let g:asyncfinder_initial_pattern="**"
" let g:asyncfinder_match_camel_case="1"
" let g:asyncfinder_ignore_dirs="['*.AppleDouble*','*.DS_Store*','*.git*','*.hg*','*.bzr*','*.jhw-cache*']"

"syntastic
" let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=1

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

" Unite
nmap <Leader>t :Unite file_rec/async<CR>
nmap <Leader>s :Unite grep:.<CR>
nmap <Leader>h :Unite history/yank<CR>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=20000
let g:unite_prompt='» '

let g:unite_source_grep_command='ag'
let g:unite_source_grep_default_opts='--noheading --nocolor -S -C4'
let g:unite_source_grep_recursive_opt=''

"toggle taglist
map <F4> :TlistToggle<cr>

let g:ctrlp_prompt_mappings = {
    \ 'PrtClearCache()':      ['<c-a>']
    \ }


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
