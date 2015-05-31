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
    # rubocop:disable Metrics/LineLength
    it 'should have volumes' do
      @c.create.must_equal("create --name='name' -v /d1/d2:/v1/v2 -v /d3/d4:/v3/v4 image command")
    end
    # rubocop:enable Metrics/LineLength
  end
  describe 'with verbs rm, wait' do
    before do
      build_container
    end
    it 'should have verb rm' do
      @c.must_respond_to :rm
    end
    it 'should rm be: rm name' do
      @c.rm.must_equal 'rm name'
    end
    it 'should have verb wait' do
      @c.must_respond_to :wait
    end
    it 'should wait be: wait' do
      @c.wait.must_equal 'wait'
    end
    it 'should have start_then_wait' do
      @c.must_respond_to :start_then_wait
    end
    it 'should start_then_wait be: ...' do
      @c.start_then_wait.must_equal 'sha=$(start name); wait ${sha}'
    end
  end
end
