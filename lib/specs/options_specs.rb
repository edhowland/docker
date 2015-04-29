# options_specs.rb - test Options

require 'minitest/autorun'
require '../container/option'


describe Option do
  before do
    @option = Option.new
  end

  it 'should be ok' do
      @option.to_s.must_equal ''end
end

describe UnaryOption do
  before do
    @option = UnaryOption.new 't'
  end

  it 'should be -t' do
    @option.to_s.must_equal '-t'
  end
end

describe LongOption do
  before do
    @option = LongOption.new('name', 'value')
  end

  it 'should be --name=value' do
    @option.to_s.must_equal "--name='value'"
  end
end
