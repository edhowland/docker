# snake_case_spec.rb - spec for snake_case method

require '../lib/support'
require 'minitest/autorun'

describe 'snake_case' do
  subject { snake_case 'CamelCase' }

  specify { subject.must_equal 'camel_case' }
end

