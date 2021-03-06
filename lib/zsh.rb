# frozen_string_literal: true

module Zsh
  def set_default
    if ENV['SHELL'] =~ /zsh/
      puts 'using zsh'
    else
      print 'switch to zsh? (recommended) [ynq] '
      case $stdin.gets.chomp
      when 'y'
        puts 'switching to zsh'
        system %(chsh -s /bin/zsh)
      when 'q'
        exit
      else
        puts 'skipping zsh'
      end
    end
  end

  def install
    if File.exist?(File.join(ENV['HOME'], '.oh-my-zsh'))
      puts 'found ~/.oh-my-zsh'
    else
      print 'install oh-my-zsh? [ynq] '
      case $stdin.gets.chomp
      when 'y'
        puts 'installing oh-my-zsh'
        system %(git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh")
      when 'q'
        exit
      else
        puts 'skipping oh-my-zsh, you will need to change ~/.zshrc'
      end
    end
  end
end
