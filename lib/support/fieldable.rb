# fieldable.rb - module Fieldable returns field list from model

module Fieldable
  # return string of comma separated fields from instance_variables
  def field_list
    self.instance_variables.map {|v| v.to_s }.map do |v|
      v =~ /@(.*)$/
      $1
    end.join(', ')
  end
end
