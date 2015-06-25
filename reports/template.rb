#!/usr/bin/env ruby
# template.rb -  for report template.html + ERb

require 'erb'
require '../lib/support'
require'../models/patient_info'
require '../lib/orm'


orm = Orm.new './patient_info.sqlite3', PatientInfo
rows = orm.select 'patient_name'
patient_info = rows[0]

simple_template = File.read(ARGV.first)

renderer = ERB.new(simple_template)
puts output = renderer.result()
