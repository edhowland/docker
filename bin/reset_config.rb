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

bad_option = !(ARGV.length == 0 or help or presets)
die usage if help or bad_option
pdftk = Config.new
pdftk.save(config_path('pdftk'))
puts '../config/pdftk.yml created'
puts 'empty pdftk.yml created' unless presets
puts 'pdftk.yml created with presets' if presets

if presets
  pdfocr = Config.new({image_name: 'pdfocr', container_name: 'pdfocr', tag: 'v0/1'}, :preset)
else
  pdfocr = Config.new
end
pdfocr.save(config_path('pdfocr'))
puts '../config/pdfocr.yml created'
puts 'empty pdfocr.yml created' unless presets
puts 'pdfocr.yml created with presets' if presets

puts 'Now use bin/configure.rb to edit the values in pdftk.yml and pdfocr.yml'
