task :init do
  mkdir_p 'bundle'
  mkdir_p 'backup'
  mkdir_p 'bin'
  sh 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim' unless File.directory?(File.expand_path('~/.vim/bundle/Vundle.vim'))
  ln_sf File.expand_path('~/.vim/vimrc'), File.expand_path('~/.vimrc')
end
