# Files which should not be moved into the home directory.
IGNORE_FILES = ['Rakefile', 'README.markdown', '.gitignore']

# Install all of the necessary files
desc "Install dotfiles."
task :install do
  Dir["*"].each do |file|
    source = File.join(Dir.pwd, file)
    basename = File.basename(source)
    next if IGNORE_FILES.include?(basename)
    destination = File.expand_path("~/.#{basename}")
    if File.symlink?(destination)
      symlink_to = File.readlink(destination)
      puts "Removing symlink #{destination} --> #{symlink_to}" if symlink_to != source
      FileUtils.rm(destination)
    elsif File.exist?(destination)
      error "#{destination} exists. Will not automatically overwrite a non-symlink. Overwrite (y/n)?"
      print "? "
      if STDIN.gets.match(/^y/i)
        info_rm "Removing #{destination}."
        FileUtils.rm_rf(destination)
      else
        next
      end
    end
    
    `ln -s #{source} #{destination}`
    
  end
end

