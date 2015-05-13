# container_factory.rb - ContainerFactory

require "#{File.dirname(__FILE__)}/container"
class ContainerFactory
  def self.load root, name
   Container.new '', '', '' 
  end
end
