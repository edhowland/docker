# fieldable_spec.rb - spec for module Fieldable

require '../lib/support'
require 'minitest/autorun'

class UnderTest
  include Fieldable

  def initialize
    @field1 = ''
    @field2 = ''
  end


  def variables_list
    self.instance_variables
  end
end

describe Fieldable do
  let(:fields) { UnderTest.new }
    subject { fields.field_list }

  specify { subject.must_equal 'field1, field2' }

end
