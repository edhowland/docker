# orm_spec.rb - spec for class Orm

require '../models/patient_info'
require '../lib/support'
require '../lib/orm'
require 'minitest/mock'
require 'minitest/autorun'


describe Orm do
  let(:orm) { Orm.new('path', PatientInfo) }

  describe 'table_name' do
    subject { orm.table_name }

    specify { subject.must_equal 'patient_info' }
  end


describe 'make_query' do
    subject { orm.make_query 'patient_name' }

    specify { subject.must_equal 'SELECT patient_name FROM patient_info' }
  end

  describe 'select' do
    subject { orm.select('patient_name') }

  specify { subject[0].must_be_instance_of PatientInfo  }

  end

end
