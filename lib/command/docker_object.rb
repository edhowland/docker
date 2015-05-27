# dockerobject.rb - Class for DockerObject

require "#{File.dirname(__FILE__)}/composable"

# TODO: describe DockerObject
class DockerObject
  include Composable
  def initialize(name)
    @name = name
    @verbs = {}
  end

  def method_name
  end
end
