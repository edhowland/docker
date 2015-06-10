# spec_rake_spec.rb - spec for SpecRake

require 'rake'
require 'minitest/autorun'

describe SpecRake do
  before do
    @rake = SpecRake.new('./tmp')
  end
end
