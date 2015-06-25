# orm_spec.rb - spec for class Orm

require '../models/patient_info'
require '../lib/orm'
require 'minitest/autorun'


describe Orm do
  let(:orm) { Orm.new('path', PatientInfo) }
  describe 'select' do
    subject { orm.select('patient_name') }

  specify { subject[0].must_be_instance_of PatientInfo  }

  end

end
