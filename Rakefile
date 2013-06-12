task :default => :install
 
desc "Install the dot files into user's home directory"
task :install do
  manifest.each do |file|
    source, file = file, File.basename(file)
 
    puts "linking ~/.#{file}"
    system %Q{rm -rf "$HOME/.#{file}"}
    system %Q{ln -s "$PWD/#{source}" "$HOME/.#{file}"}
  end
end
 
desc "List untracked dot files"
task :untracked do
  unless File.exists?(File.expand_path('~/.Ignore'))
    system %Q{ln -s $PWD/Ignore $HOME/.Ignore}
  end
  sh "cd $HOME && find .* ! -type l -maxdepth 0 | grep -v -f .Ignore"
end
 
def manifest
  files = Dir['*']
  files -= %w(Rakefile)
  files.sort
end
