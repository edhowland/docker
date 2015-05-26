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

# edit config worker
def ask_value(object, name)
  sym = name.to_s + '='
  sym = sym.to_sym
  current =  object.send(name)
  value = get_value(name.to_s, current)
  object.send(sym, value)
end

# given a Config object, ask user for attributes and return new object
def edit_config(config)
  [:registry, :image_name, :tag, :container_name, :arg].each do |sym|
    ask_value(config, sym)
  end
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
