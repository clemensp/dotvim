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


" CTags
nmap <C-F5> :!ctags --extra=+f -R *<CR><CR>
nmap <C-\> :tnext<CR>

" ,, to toggle 'zooming' a split
nmap <Leader><Leader> :ZoomWin<CR>

" ,n for NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nmap <Leader>n :NERDTreeToggle<CR>

" Command-t
let g:CommandTMaxHeight=20
nmap <silent> <a-t> :CommandT<cr>
imap <silent> <a-t> <esc>:CommandT<cr>
nmap <silent> <f5> :CommandTFlush<cr>
let g:CommandTMatchWindowAtTop = 1

" ctrl-F for Ack
nmap <C-F> :Ack<space>

" ctrl-e for ConqueTerm
function! StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction
nmap <C-e> :call StartTerm()<CR>

"ctrl-b for bufexplorer
nmap <c-b> ,be
imap <c-b> <esc>,be

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

",p for hammer
nmap <Leader>p :Hammer<CR>
