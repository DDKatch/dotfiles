# frozen_string_literal: true

module FileStuff
  def hidden_files
    files = Dir['.*']
    files - %w[. .. .git .gitignore README.md]
  end

  def visible_files
    Dir['*'] - %w[Rakefile lib git-config.sh]
  end

  def replace_file(file)
    system %(rm -rf "$HOME/#{file}")
    link_file(file)
  end

  def link_file(file)
    if file =~ /zshrc$/ # copy zshrc instead of link
      puts "copying ~/#{file}"
      system %(cp "$PWD/#{file}" "$HOME/#{file}")
    else
      puts "linking ~/#{file}"
      system %(ln -s "$PWD/#{file}" "$HOME/#{file}")
    end
  end
end
