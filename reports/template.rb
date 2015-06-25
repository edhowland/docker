#!/usr/bin/env ruby
# template.rb -  for report template.html + ERb

require 'erb'
require '../lib/support'
require'../models/patient_info'
require '../lib/orm'


orm = Orm.new './patient_info.sqlite3', PatientInfo
field_list = %w[ patient_name  date_of_birth mrn gender referring_physician referring_pathologist accession_number specimen_type tissue_type indication  date_collected date_ordered ].join(',')

rows = orm.select field_list
patient_info = rows[0]

simple_template = File.read(ARGV.first)

renderer = ERB.new(simple_template)
puts output = renderer.result()
