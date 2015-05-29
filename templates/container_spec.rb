require 'minitest/autorun'
require './container'

describe Container do
  describe 'with full options' do
    before do
      @c = Container.new 'image', 'name', 'command'
    end
    it 'should have a create method' do
      @c.must_respond_to :create
    end
    it 'should be create ...' do
      @c.create.must_equal "create --name='name' image command"
    end

    it 'should have a start method' do
      @c.must_respond_to :start
    end
  end
  describe 'something' do
    before do

    end
    it 'should do something' do

    end
  end
  describe 'something' do
    before do

    end
    it 'should do something' do

    end
  end
end
