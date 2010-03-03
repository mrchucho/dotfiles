require 'rubygems'
require 'wirble'
require 'hirb'

IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 100

Wirble.init
Wirble.colorize
Hirb.enable

extend Hirb::Console

# require everything in irb/*
