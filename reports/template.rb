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
  opts.banner  = "template.rb [ options, ... ]\nReport on patient_info database using a template.html"
      opts.separator ""
      opts.separator "Specific options:"

  opts.on('--template file', String, 'The template.html touse') do  |file|
    template = file
  end
  opts.on('-p', '--patient', 'Selects the patient with this name') do |name|
    filter = {where: "patient_name = \"#{name}\"" }
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

puts "using #{template} for the template"
puts "Found #{rows.length} rows"
patient_info = rows[0]
rows.each do |p|
  patient_info = p
  fname = "MRN_#{patient_info.mrn}.html"
  puts "Writing #{fname}"
  File.open(fname, 'w') do |f|

simple_template = File.read(template)

renderer = ERB.new(simple_template)
    f.puts renderer.result()
  end
end
