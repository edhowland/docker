# fieldable_spec.rb - spec for module Fieldable

require '../lib/support'
require 'minitest/autorun'

class UnderTest
  include Fieldable

  @field1 = ''
  @field2 = ''
end

describe Fieldable do

end
