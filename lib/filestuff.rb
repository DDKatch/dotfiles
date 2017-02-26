module FileStuff
  def hidden_files
    files = Dir['.*']
    files - %w{. .. .git}
  end

  def visible_files
    Dir['*'] - %w{Rakefile lib}
  end

  def replace_file(file)
    system %Q{rm -rf "$HOME/#{file}"}
    link_file(file)
  end

  def link_file(file)
    if file =~ /zshrc$/ # copy zshrc instead of link
      puts "copying ~/#{file}"
      system %Q{cp "$PWD/#{file}" "$HOME/#{file}"}
    else
      puts "linking ~/#{file}"
      system %Q{ln -s "$PWD/#{file}" "$HOME/#{file}"}
    end
  end
end


