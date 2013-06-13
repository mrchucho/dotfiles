# encoding: UTF-8
Pry.config.should_load_plugins = false # whitelist
Pry.config.editor = "vim"

# -----------------------------------------------------------------------------
# RAILS
# -----------------------------------------------------------------------------
rails = File.join Dir.getwd, 'config', 'environment.rb'
if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
  require rails
  if Rails.version[0..0] == "2"
    require 'console_app'
    require 'console_with_helpers'
  elsif Rails.version[0..0] == "3"
    require 'rails/console/app'
    require 'rails/console/helpers'
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    include Rails::ConsoleMethods # enable reload!
  else
    warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
  end
end


# -----------------------------------------------------------------------------
# HIRB
# -----------------------------------------------------------------------------
require 'hirb'
Hirb.enable
old_print = Pry.config.print
Pry.config.print = proc do |output, value|
  Hirb::View.view_or_page_output(value) || old_print.call(output, value)
end

puts "🔧" # wrench!
