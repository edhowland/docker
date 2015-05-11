# config_spec.rb - testing for config.rake

require 'minitest/autorun'
require '../tasks/config'

describe Config do
  before do
    @c = Config.new
  @c.image_name = 'pdftk'
    @c.container_name = 'piper.pdftk'
  @c.registry = 'swinehart'
  @c.tag = 'v0.1'
  end
describe 'saving Config object' do
  it 'should write out config' do
    @c.save('spec.yml')
  end
end


describe 'loading YAML file' do
  before do
    @c = Config.load('spec.yml')
  end

  it 'should be instance of Config' do
    @c.must_be_instance_of Config
  end

  it 'should be image_name :pdftk ' do
    @c.image_name.must_equal 'pdftk'
  end
  it 'should registry be : swinehart' do
    @c.registry.must_equal 'swinehart'
  end

  it 'should container_name be : piper.pdftk' do
    @c.container_name.must_equal 'piper.pdftk'
  end

  it 'should tagg be : v0.1' do
    @c.tag.must_equal 'v0.1'
  end
end
end
