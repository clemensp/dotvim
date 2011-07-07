" ,tp to add .tap &method(:puts) to a line
autocmd FileType ruby nmap <Leader>tp mpA.tap &method(:puts)<esc>`p

" ,apc to puts the line and copy it
autocmd FileType ruby nmap <Leader>apc mpyypkIap(<esc>A)<esc>`p3l

" ,ap<space> to puts the line
autocmd FileType ruby nmap <Leader>ap<space> mpIap(<esc>A)<esc>`p3l

"debug message in ruby
autocmd FileType ruby nmap <Leader>db op<space>'<esc>50i#'<esc>A<cr>p<space>'<c-r>%'<cr>p<space>'<esc>50i#'<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                         stuff    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       functions  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  set ft=markdown
endfunction
