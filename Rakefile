# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Bookshelf::Application.load_tasks


begin
  require 'thinking_sphinx/tasks'
rescue LoadError
  puts "You can't load Thinking Sphinx tasks unless the thinking-sphinx gem is installed."
end