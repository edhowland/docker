#!/usr/bin/env ruby
# reset_config.rb - resets config/pdf*.yml to factory defaults

DOCKER_ROOT = "#{File.dirname(__FILE__)}/.."
CONFIG_ROOT = DOCKER_ROOT + '/config'

require '../lib/tasks/config'
require "#{File.dirname(__FILE__)}/config_path"

usage = <<-EOD
Usage: ./reset_configure.rb [option]
  Options:
          -p, --preset : Set default values for YAML files.
          -h, --help : Print this help and exit.
EOD

def die message
  puts message
  exit
end



option = ARGV.first
help = (option == '-h' || option == '--help')
presets = (option == '-p' || option == '--preset')

die usage if help
pdftk = Config.new
pdftk.save(config_path('pdftk'))
puts '../config/pdftk.yml created'
puts 'empty pdftk.yml created' unless presets

pdfocr = Config.new
pdfocr.save(config_path('pdfocr'))
puts '../config/pdfocr.yml created'
puts 'empty pdfocr.yml created' unless presets

puts 'Now use bin/configure.rb to edit the values in pdftk.yml and pdfocr.yml'
