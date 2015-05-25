# method_spec_templ.rb - create a spec for a single method
# usage: ruby method_spec_templ.rb method_name > method_spec.rb

require './spec_maker'

@tree = describe_method do
  around_method do
    it_maker
  end
end
