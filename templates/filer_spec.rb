# filer_spec.rb - Spec for filer

require 'minitest/autorun'
require './filer'

def file_mocker(name, mode, &blk)
  fmock = MiniTest::Mock.new
  yield(fmock)
  mock = MiniTest::Mock.new
  mock.expect(:open, true) do |a1, a2, &block|
    block.call(fmock)
    a1 == name && a2 == mode && fmock.verify
  end
  mock
end
describe "Mocking" do
  before do
        #@mock = MiniTest::Mock.new
    #@mock.expect(:open,true) do |a1, a2, &blk|
          #fmock = MiniTest::Mock.new  
      #fmock.expect(:puts, nil, ['hello'])
      #blk.call(fmock)
      #a1 == 'file.txt' && a2 == 'w' && fmock.verify
    #end

    @mock = file_mocker('file.txt', 'w') do |fmock|
      fmock.expect(:puts, nil, ['hello'])
    end
  end
  it "should do something" do
        file_write @mock
    @mock.verify
  end
end
