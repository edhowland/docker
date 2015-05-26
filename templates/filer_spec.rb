# filer_spec.rb - Spec for filer

require 'minitest/autorun'
require './filer'

describe "Mocking" do
  before do
        @mock = MiniTest::Mock.new
    @mock.expect(:open,true) do |a1, a2, &blk|
          fmock = MiniTest::Mock.new  
      fmock.expect(:puts, nil, ['hello'])
      blk.call(fmock)
      a1 == 'file.txt' && a2 == 'w' && fmock.verify
    end
  end
  it "should do something" do
        file_write @mock
    @mock.verify
  end
end
