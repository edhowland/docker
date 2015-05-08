# container_spec.rb - specs for lib/container/container.rb


require 'minitest/autorun'
require '../container'

describe Container do
  describe 'with full options' do
    before do
  @c = Container.new 'image', 'name', 'command' 
    end
    it 'should have a create method' do
      @c.must_respond_to :create
    end

    it 'should not be empty' do
      @c.create.wont_be_empty
    end


    it 'should be : create --name=\'name\' image command' do
      @c.create.must_equal "create --name='name' image command"
    end

    it 'should have a start method' do
      @c.must_respond_to :start
    end

    it 'should not be empty' do
      @c.start.wont_be_empty
    end

    it 'should be "start name"' do
      @c.start.must_equal 'start name'
    end
  end 
end
