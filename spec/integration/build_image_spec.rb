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
      # rake invoke pdftk
    end

    it 'should exist' do
      # JSON of image and wont_equal 0 length
    end
  end
end
