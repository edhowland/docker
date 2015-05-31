#!/usr/bin/env ruby
# simple_spec_temp.rb - simple spec maker with describe, before, it

require './spec_maker'

@tree = describe_something do
  before_maker + it_maker
end
