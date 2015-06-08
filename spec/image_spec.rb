# image_spec.rb - specs for lib/image/image.rb: Image
require 'minitest/autorun'
require './spec_helper'
require 'image'

describe Image do
  before do
    @i = Image.new('swinehart/pdftk:v0.1')
  end

  it 'should name be : swinehart/pdftk:v0.1' do
    @i.name.must_equal 'swinehart/pdftk:v0.1'
  end

  it 'should build be : build -t "swinehart/pdftk:v0.1" .' do
    @i.build.must_equal 'build -t "swinehart/pdftk:v0.1" .'
  end

  it 'should be rmi swinehart/pdftk:v0.1' do
    @i.rmi.must_equal 'rmi swinehart/pdftk:v0.1'
  end

  it 'should be imspect swinehart/pdftk:v0.1' do
    @i.docker_inspect.must_equal 'inspect swinehart/pdftk:v0.1'
  end
end
