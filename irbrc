require 'rubygems'
require 'wirble'
require 'hirb'

IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100

# Wirble -------
Wirble.init
Wirble.colorize

# Hirb ---------
Hirb.enable
extend Hirb::Console
