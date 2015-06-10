# build_image_spec.rb - specs for build/Rakefile

require 'json'
require 'rake'
rake 'minitest/autorun'


describe 'rake can build' do
  before do
    # rake clean - remove all existing images
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
