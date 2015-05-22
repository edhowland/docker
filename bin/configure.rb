#!/usr/bin/env ruby
# configure.rb - edits config/pdftk.yml and config/pdfocr
DOCKER_ROOT = "#{File.dirname(__FILE__)}/.."
CONFIG_ROOT = DOCKER_ROOT + '/config'

require DOCKER_ROOT + '/lib/tasks/config'
require "#{File.dirname(__FILE__)}/config_path"
require "#{File.dirname(__FILE__)}/vol_editor"

# get a string value from the user with the name and default
def get_value(name, default)
  print ".#{name} (#{default}) : "
  tmp = gets
  tmp = tmp.chomp
  (tmp.empty? ? default : tmp)
end

# given a Config object, ask user for attributes and return new object
def edit_config(config)
  config.registry = get_value('registry', config.registry)
  config.image_name = get_value('image name', config.image_name)
  config.tag = get_value('tag', config.tag)
  config.container_name = get_value('container_name', config.container_name)
  config.arg = get_value('Command to be run', config.arg)
  editor = VolEditor.new(config.vols_hash)
  config.vols_hash = editor.repl
  config
end

# loads the existing path into Config
# edits it and saves back to path
def load_edit_save(name)
  config = Config.load(config_path(name))
  config  = edit_config(config)
  config.save(config_path(name))
end

puts 'Edit config values for : pdftk'
load_edit_save 'pdftk'

puts ''
puts 'Edit values for : pdfocr'
load_edit_save 'pdfocr'
