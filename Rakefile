namespace :setup do
  task :plugins do
    # hammer
    sh "gem install github-markup redcarpet RedCloth"

    # command_t
    Dir.chdir "bundle/command-t/ruby/command-t" do
      if File.exists?("/usr/bin/ruby1.8") # prefer 1.8 on *.deb systems
        sh "/usr/bin/ruby1.8 extconf.rb"
      elsif File.exists?("/usr/bin/ruby") # prefer system rubies
        sh "/usr/bin/ruby extconf.rb"
      elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
        sh "rvm system ruby extconf.rb"
      end
      sh "make clean && make"
    end
  end
end

task :init do
  sh 'git submodule init && git submodule update'
  sh 'mkdir backup'
  sh 'ln -s vimrc ../.vimrc'
end
