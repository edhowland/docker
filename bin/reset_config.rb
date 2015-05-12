#!/usr/bin/env ruby
# reset_config.rb - resets config/pdf*.yml to factory defaults

require '../lib/tasks/config'

pdftk = Config.new
pdftk.save '../config/pdftk.yml'
puts '../config/pdftk.yml created'

pdfocr = Config.new
pdfocr.save '../config/pdfocr'
puts '../config/pdfocr.yml created'

