# template.rb -  for report template.html + ERb

require 'ERb'
require '../lib/support'
require'../models/patient_info'
require '../lib/orm'


orm = Orm.new '.patient_info.sqlite3', PatientInfo
rows = orm.select 'patient_name'


simple_template = File.read(ARGV.first)

renderer = ERB.new(simple_template)
puts output = renderer.result()
