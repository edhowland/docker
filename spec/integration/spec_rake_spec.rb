# spec_rake_spec.rb - spec for SpecRake

require 'fileutils'
require 'rake'
require './spec_rake'
require 'minitest/autorun'

describe SpecRake do
  before do
    @rake = SpecRake.new('./tmp')
  end

  describe 'clean' do
    before do
      FileUtils.touch('./tmp/test')
      @rake.clean
    end

  it 'should not have a file: tmp/test' do
      File.exists?('./tmp/test/').wont_be true
     end
    
  end
end
