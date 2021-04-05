require 'rake'
# require 'pry'

Dir['lib/*.rb'].each { |file| require_relative file }

include Zsh
include FileStuff

namespace :install do
  desc 'Install initial tools'
  task :initial do
    system %Q{brew install gnupg}
    system %Q{brew install coreutils curl git}
    system %Q{brew install asdf}
  end

  desc "Install neovim"
  task :neovim do
    puts 'installing neovim...'
    system %Q{brew install neovim}
  end

  namespace :neovim do
    desc 'Install plug, python, ruby, nodejs'
    task :all do
      %i(plug python ruby nodejs).each { |t| Rake::Task["install:neovim:#{t}"].execute }
    end

    desc "Install neovim plugin manager Plug"
    task :plug do
      puts 'installing Plug...'
      system %Q{sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'}
    end

    desc "Install python with neovim packages"
    task :python do
      puts 'installing python..'
      system %Q{asdf plugin-add python}
      system %Q{asdf install python 3.9.2}
      system %Q{asdf install python 2.7.18}
      system %Q{asdf python global 3.9.2 2.7.18}
      system %Q{pip2 install pynvim}
      system %Q{pip3 install pynvim --user}
    end

    desc "Install ruby with neovim packages"
    task :ruby do
      puts 'installing ruby...'
      system %Q{asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git}
      system %Q{asdf install ruby 3.0.0}
      system %Q{gem install neovim}
    end

    desc "Install nodejs with neovim packages"
    task :nodejs do
      puts 'installing nodejs...'
      system %Q{asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git}
      system %Q{asdf install nodejs 15.13.0}
      system %Q{asdf global nodejs 15.13.0}
      system %Q{brew install yarn}
      system %Q{yarn global add neovim}
    end
  end

  desc "Install zsh, initial, dotfiles, neovim"
  task :all do
    %i(zsh initial dotfiles neovim).each { |t| Rake::Task["install:#{t}"].execute }
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
