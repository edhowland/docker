# class_spec_temp.rb - template for class spec with one method
require './spec_maker'

@tree = describe_class do
  describe_method do
    before_maker + it_maker
  end
end
