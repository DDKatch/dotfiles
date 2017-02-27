require 'rake'
require 'pry'

Dir['lib/*.rb'].each { |file| require_relative file }

include Zsh
include FileStuff

namespace :install do
  desc "Install zsh, dotfiles, vim vundle"
  task :all do
    [:zsh, :vundle, :dotfiles].each { |t| Rake::Task["install:#{t}"].execute }
  end
  
  desc "Install zsh with oh-my-zsh extention and make it as default shell"
  task :zsh do
    Zsh::install
    Zsh::set_default 
  end
  
  desc "Install vim plugin manager Vundle"
  task :vundle do
    puts 'installing Vundle'
    system %Q{git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim}
  end
  
  desc "Install the dot files into user's home directory"
  task :dotfiles do
    replace_all = false
    files = hidden_files + visible_files
    files.each do |file|
      system %Q{mkdir -p "$HOME/#{File.dirname(file)}"} if file =~ /\//
      if File.exist?(File.join(ENV['HOME'], "#{file}"))
        if File.identical? file, File.join(ENV['HOME'], "#{file}")
          puts "identical ~/#{file}"
        elsif replace_all
          replace_file(file)
        else
          print "overwrite ~/#{file}? [ynaq] "
          case $stdin.gets.chomp
          when 'a'
            replace_all = true
            replace_file(file)
          when 'y'
            replace_file(file)
          when 'q'
            exit
          else
            puts "skipping ~/#{file}"
          end
        end
      else
        link_file(file)
      end
    end
  end
end
