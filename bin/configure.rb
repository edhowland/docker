#!/usr/bin/env ruby
# configure.rb - edits config/pdftk.yml and config/pdfocr
DOCKER_ROOT="#{File.dirname(__FILE__)}/.."
CONFIG_ROOT=DOCKER_ROOT+'/config'

require DOCKER_ROOT+'/lib/tasks/config'

# REMOVE this
def config_path name
  "#{CONFIG_ROOT}/#{name}.yml"
end
# get a string value from the user with the name and default
def get_value(name, default)
  print ".#{name} (#{default}) : "
  gets
end

# given a Config object, ask user for attributes and return new object
def edit_config config
  config.registry = get_value('registry', config.registry)
  config.image_name = get_value('image name', config.image_name)
  config.tag = get_value('tag', config.tag)
  config.container_name = get_value('container_name', config.container_name)
  config
end

pdftk = Config.load(config_path('pdftk'))
new_pdftk = edit_config(pdftk)
new_pdftk.save(configpath('pdftk'))
