# verb_spec.rb - specs to test Berb

require 'minitest/autorun'
require '../container'

describe Verb do
  describe 'with name, flags and arg' do
  before do
    @verb=Verb.new 'create', 'date', '-c', '--name=name', '-v jjj'
  end

  it 'should be: create -c --name=name -v jjj arg' do
    @verb.to_s.must_equal 'create -c --name=name -v jjj date'
  end
  end

  describe 'with name and arg only' do
    before do
      @verb=Verb.new('start', 'name')
    end

    it 'should be: start name' do
        @verb.to_s.must_equal 'start name'
      end
  end

  describe 'with one or more options' do
    before do
      @v=Verb.new('create', 'image', LongOption.new('name', 'pdftk'))
  end

    it 'should be : create --name=pdftk image' do
 #     @v.to_s.must_equal 'create --name=pdftk image'
    end
end


  describe 'with a LongOption and UnaryOption' do
    before do
      @v=Verb.new('create', 'image', LongOption.new('name', 'pdftk'), UnaryOption.new('t'))
    end

    it 'should be : create --name="pdftk" -t image' do
      @v.to_s.must_equal 'create --name=\'pdftk\' -t image'
    end
  end



end
