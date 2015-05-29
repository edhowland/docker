require 'minitest/autorun'
require './container'

def build_container(hash)
  Container.new('image', 'name', 'command', hash)
end
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
    it 'should be "start name"' do
      @c.start.must_equal 'start name'
    end
  end
  describe 'with volume hash' do
    before do
      @c = build_container '/d1/d2' => '/v1/v2', '/d3/d4' => '/v3/v4'
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
