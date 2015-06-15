# build_image_spec.rb - specs for build/Rakefile

require 'json'
require 'rake'
require 'fileutils'
require './spec_rake'
require 'minitest/autorun'

describe 'rake can build' do
  before do
    @rake = SpecRake.new '../../build'
      @rake.clean
  end
  describe 'pdftk' do
    before do
      @rake.pdftk
    end

    it 'should exist' do
      json=`sudo docker inspect edhowland/pdftk:v0.1`
      JSON.parse(json).length.wont_equal 0
    end
  end
end
