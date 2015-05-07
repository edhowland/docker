# container_spec.rb - specs for lib/container/container.rb


require 'minitest/autorun'
require '../container'

describe Container do
  describe 'with full options' do
    before do
  @c = Container.new 'image', 'name', 'command' 
    end
    it 'should have a start method' do
      @c.must_respond_to :start
    end

    it 'should work with compose' do
      @c.start
  @c.to_s.wont_be_empty
    end
    it 'should not be empty' do
      @c.start.wont_be_empty
    end
  end 
end
