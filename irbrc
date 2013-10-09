# encoding: UTF-8
begin
  begin
    require 'hirb'

    Hirb.enable
    extend Hirb::Console

    def vert(*args)
      r = args
      table r, vertical: true
      r
    end
  rescue LoadError
    $stderr.puts 'Skipping hirb...'
  end

  begin
    require 'pry-editline'
  rescue LoadError
    $stderr.puts 'Skipping PRY...'
  end

  require 'irb/completion'

  # http://stackoverflow.com/questions/8806643/colorized-output-breaks-linewrapping-with-readline
  IRB.conf[:PROMPT][:COLOR] = {}
  IRB.conf[:PROMPT][:DEFAULT].each do |k, v|
    IRB.conf[:PROMPT][:COLOR][k] = v =~ /\n/ ? v : "\e[01;32m#{v}\e[00m"
  end

  IRB.conf[:PROMPT_MODE]  = :COLOR
  IRB.conf[:EVAL_HISTORY] = 1000
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:AUTO_INDENT]  = true
  IRB.conf[:USE_READLINE] = true

  puts "😄" # Smiley

rescue LoadError, RuntimeError => e
  $stderr.puts e.message
  puts "😢" # Sad Face
  exit 1
end
