#!/usr/bin/env ruby
# reset_config.rb - resets config/pdf*.yml to factory defaults

DOCKER_ROOT = "#{File.dirname(__FILE__)}/.."
CONFIG_ROOT = DOCKER_ROOT + '/config'

require '../lib/tasks/config'
require "#{File.dirname(__FILE__)}/config_path"

pdftk = Config.new
pdftk.save(config_path('pdftk'))
puts '../config/pdftk.yml created'

pdfocr = Config.new
pdfocr.save(config_path('pdfocr'))
puts '../config/pdfocr.yml created'
