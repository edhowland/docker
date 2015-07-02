# orm_spec.rb - spec for class Orm

require '../lib/support'
require '../models/patient_info'
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

  describe "Orm.new(dbname, 'patient_name'" do
    let(:orm) { Orm.new '', 'patient_info' }
    before do
      @dbmock = Minitest::Mock.new
      @dbmock.expect(:results_as_hash=, true, [true])
      @dbmock.expect(:execute, [{}], ['SELECT * FROM patient_info'])
      @dbmock.expect(:close, nil)
    SQLite3::Database.stub(:open, @dbmock, ['']) do
        orm.db_execute '*'
      end
    end

    it('should have called db.results_as_hash= true') { @dbmock.verify }
  end

  describe 'key_string_sym' do
    let(:orm) { Orm.new '', 'patient_info' }
    subject { orm.key_string_to_sym({'string' => 'value'}) }

    specify { subject.must_equal({:string => 'value'}) }
  end

  describe 'Orm.new ..., "table_name"' do
    let(:orm) { Orm.new '', 'patient_info' }
    let(:mock) { Minitest::Mock.new }
    subject do
      mock.expect(:results_as_hash=, true, [true])
      mock.expect(:execute, [{'mrn' => '123456'}], ['SELECT * FROM patient_info'])
      mock.expect(:close, nil)
      SQLite3::Database.stub(:open, mock, [''])  { orm.select '*'}
    end

    specify { skip(); subject[0].must_be_instance_of Hash; mock.verify }
  end

  describe 'Orm.new ..., ModelName' do
    let(:orm) { Orm.new '', PatientInfo }
    let(:mock) { Minitest::Mock.new }
    subject do
      mock.expect(:execute, [{}], ['SELECT * FROM patient_info'])
      mock.expect(:close, nil)
      SQLite3::Database.stub(:open, mock, [''])  { orm.select '*'}
    end

    specify {  subject[0].must_be_instance_of PatientInfo; mock.verify }
  end
end
