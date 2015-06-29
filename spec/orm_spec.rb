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

  describe 'make_query with where clause in hash' do
    subject { orm.make_query '*', where: 'patient_name = "FooBar"' }

    specify { subject.must_equal 'SELECT * FROM patient_info WHERE patient_name = "FooBar"' }
  end

  describe 'select' do
    before { @dbmock = MiniTest::Mock.new }
    subject { 
      @dbmock.expect(:execute, [['FooBar']],  ['SELECT patient_name FROM patient_info']) 
      @dbmock.expect(:close, nil)
      SQLite3::Database.stub(:open, @dbmock) do
        orm.select('patient_name') 
      end
      }

  specify {@dbmock.verify; subject[0].must_be_instance_of PatientInfo  }

  end

end
