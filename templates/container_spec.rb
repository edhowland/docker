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
