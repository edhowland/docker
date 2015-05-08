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


  describe 'with volumes' do
    before do
      @c = Container.new('image', 'name', 'command', '/d1/d2' => '/v1/v2', '/d3/d4' => '/v3/v4')
   end
    it 'should have vols_hash method' do
      @c.must_respond_to :vols_hash
    end
  it 'should not have empty vols_hash' do
      @c.vols_hash.wont_be_nil
  @c.vols_hash.wont_be_empty
    end 

    it 'should be : create --name=\'name\' -v /d1/d2:/v1/v2 -v /d3/d4:/v3/v4 image command' do
      @c.create.must_equal "create --name='name' -v /d1/d2:/v1/v2 -v /d3/d4:/v3/v4 image command"
   end
  end
end
