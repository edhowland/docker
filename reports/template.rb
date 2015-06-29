#!/usr/bin/env ruby
# template.rb -  for report template.html + ERb

require 'optparse'
require 'erb'
require '../lib/support'
require'../models/patient_info'
require '../lib/orm'

template = 'template.html' # default template unless -t option is given
filter = {}

parser = OptionParser.new do |opts|
  opts.on('-t', '--template', 'The template.html touse') do 
    template = 'template.html'
  end
  opts.on('-p', '--patient', 'Selects the patient with this name') do
    filter = {where: "patient_name = \"FooBar\"" }
  end
  opts.on('-h', '--help', 'Displays this help') do
    puts opts
    exit
  end 
end

parser.parse!

parser.parse!

orm = Orm.new './patient_info.sqlite3', PatientInfo
field_list = %w[ patient_name  date_of_birth mrn gender referring_physician referring_pathologist accession_number specimen_type tissue_type indication  date_collected date_ordered ].join(',')

rows = orm.select field_list, filter

patient_info = rows[0]
rows.each do |p|
  patient_info = p
  File.open("MRN_#{patient_info.mrn}.html", 'w') do |f|

simple_template = File.read(ARGV.first)

renderer = ERB.new(simple_template)
    f.puts renderer.result()
  end
end
