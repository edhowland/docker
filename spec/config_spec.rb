# config_spec.rb - testing for config.rake

require 'minitest/autorun'
require './spec_helper'
require 'tasks/config'

describe Config do
  before do
    @c = Config.new
    @c.image_name = 'pdftk'
    @c.container_name = 'piper.pdftk'
    @c.registry = 'swinehart'
    @c.tag = 'v0.1'
    @c.arg = 'run.sh'
    @c.save('spec.yml')
  end

  after do
    File.unlink './spec.yml'
  end
  describe 'empty config object' do
    before do
      @empty = Config.new
    end

    it 'should image_name be : ""' do
      @empty.image_name.must_equal ''
    end
    it 'should container_name be : ""' do
      @empty.container_name.must_equal ''
    end

    it 'should registry be : ""' do
      @empty.registry.must_equal ''
    end

    it 'should tag be : ""' do
      @empty.tag.must_equal ''
    end

    it 'should arg be empty' do
      @empty.arg.must_be_empty
    end

    it 'should vols_hash be empty' do
      @empty.vols_hash.must_be_empty
    end
  end
  describe 'saving Config object' do
    it 'should write out config' do
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

    it 'should arg be : run.sh' do
      @c.arg.must_equal 'run.sh'
    end

    it 'should image_full_name be : swinehart/pdftk:v0.1' do
      @c.image_full_name.must_equal 'swinehart/pdftk:v0.1'
    end
  end
end

describe 'Config with presets' do
  before do
    @c = Config.new({image_name: 'pdftk', container_name: 'pdftk'}, :preset)
    @user = ENV['USER']
  end

  it 'should have current user for registry' do
      @c.registry.must_equal @user
  end

  it 'dhould have image_name: pdftk' do
    @c.image_name.must_equal 'pdftk'
  end

  it 'should have container_name: pdftk' do
    @c.container_name.must_equal 'pdftk'
  end
end
