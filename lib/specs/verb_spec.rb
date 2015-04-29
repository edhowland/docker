# verb_spec.rb - specs to test Berb

require 'minitest/autorun'
require '../container/verb'

describe Verb do
  before do
    @verb=Verb.new 'create', 'date', '-v', '--name=name', '-v jjj'
  end
end
