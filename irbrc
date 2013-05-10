require 'hirb'
require 'irb/completion'

IRB.conf[:PROMPT][:COLOR] = {}
IRB.conf[:PROMPT][:DEFAULT].each do |k, v|
  IRB.conf[:PROMPT][:COLOR][k] = v =~ /\n/ ? v : "\e[0;33m#{v}\e[0m"
end

IRB.conf[:PROMPT_MODE] = :COLOR
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100

# Hirb ---------
Hirb.enable
extend Hirb::Console
