namespace :plugin do
  task :setup do
    # command_t
    Dir.chdir "bundle/Command-T/ruby/command-t" do
      if File.exists?("/usr/bin/ruby1.8") # prefer 1.8 on *.deb systems
        sh "/usr/bin/ruby1.8 extconf.rb"
      elsif File.exists?("/usr/bin/ruby") # prefer system rubies
        sh "/usr/bin/ruby extconf.rb"
      elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
        sh "rvm system ruby extconf.rb"
      end
      sh "make clean && make"

      # the presence of this file will enable the rest of the vimrc
      sh 'touch .plugins_installed'
    end
  end
end


task :init do
  sh 'mkdir bundle'
  sh 'git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle'
  sh 'mkdir backup'
  sh 'mkdir bin'
  sh 'ln -sf $HOME/.vim/vimrc $HOME/.vimrc'
end
