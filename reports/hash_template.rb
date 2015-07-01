#!/usr/bin/env ruby
# hash_template.rb -  for report hash_template.html + ERb

require 'optparse'
require 'erb'
require '../lib/support'
require '../lib/orm'

template = 'hash_template.html' # default template unless --template option is given
filter = {}

parser = OptionParser.new do |opts|
  opts.banner  = "template.rb [ options, ... ]\nReport on patient_info database using a template.html"
      opts.separator ""
      opts.separator "Specific options:"

  opts.on('--template file', String, 'The template.html touse') do  |file|
    template = file
  end

  opts.on('--mrn MRN', String, 'Selects the patient with MRN') do |mrn|
    filter = {where: "mrn = \"#{mrn}\"" }
  end
  opts.on('--patient name', String, 'Selects the patient with this name') do |name|
    filter = {where: "patient_name = \"#{name}\"" }
  end
  opts.on('-h', '--help', 'Displays this help') do
    puts opts
    exit
  end 
end

parser.parse!

parser.parse!

orm = Orm.new './patient_info.sqlite3', 'patient_info'

rows = orm.select '*', filter

puts "using #{template} for the template"
puts "Filtering on #{filter}" unless filter.empty?
puts "Found #{rows.length} rows"
rows.each do |p|
  fname = "MRN_#{p[:mrn]}.html"
  puts "Writing #{fname}"
  File.open(fname, 'w') do |f|

simple_template = File.read(template)

renderer = ERB.new(simple_template)
    f.puts renderer.result()
  end
end
