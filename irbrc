require 'hirb'

IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100

# Hirb ---------
Hirb.enable
extend Hirb::Console
