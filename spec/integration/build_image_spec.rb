# build_image_spec.rb - specs for build/Rakefile

require 'json'
require 'rake'
require 'fileutils'
require './spec_rake'
require '../../lib/image' 
require 'minitest/autorun'

describe 'rake can build' do
  before do
    @rake = SpecRake.new '../../build'
      @rake.clean
  end
  describe 'pdftk' do
    before do
  @pdftk = ImageFactory.load('../../config', 'pdftk')
      @rake.pdftk
    end

    it 'should exist' do
      json=`sudo docker inspect #{pdftk.name}`
      JSON.parse(json).length.wont_equal 0
    end
  end
  describe 'pdfocr' do
    before do
      @rake.pdfocr
    end

    it 'should have built pdfocr' do
      json=`sudo docker inspect edhowland/pdfocr:v0.1`
      JSON.parse(json).length.wont_equal 0
    end

  end
end
