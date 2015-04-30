# verb_spec.rb - specs to test Berb

require 'minitest/autorun'
require '../container/verb'

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
end
