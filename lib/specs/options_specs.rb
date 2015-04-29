# options_specs.rb - test Options

require 'minitest/autorun'
require '../container/option'
require '../container/hash_option'


describe Option do
  before do
    @option = Option.new
  end
  it 'should be ok' do
      @option.to_s.must_equal ''
end
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

describe BinaryOption do
  before do
    @option=BinaryOption.new 'v', 'value'
  end

  it 'should be -v value' do
    @option.to_s.must_equal '-v value'
  end
end


describe HashOption do
  describe 'one hash element' do
    before do
      @option=HashOption.new 'v', '/d1/d2' => '/t1/t2'
    end
   it 'should be -v /d1/d2:/t1/t2' do
      @option.to_s.must_equal '-v /d1/d2:/t1/t2'
    end
  end


  describe 'multiple hash elements' do
    before do
      @option=HashOption.new
    end

  it 'should be ----------' do
      @option.to_s.must_equal ''
  end
  end
  end
