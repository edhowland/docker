# image_factory.rb - ImageFactory

require "#{File.dirname(__FILE__)}/../command"
require "#{File.dirname(__FILE__)}/image"
require"#{File.dirname(__FILE__)}/../tasks/config" 

class ImageFactory
  def self.load(root, name)
    config = Config.load("#{root}/#{name}.yml")
    image_name = "#{config.registry}/#{config.image_name}:#{config.tag}"
  image = Sudo.new + Docker.new + Image.new(image_name)
    image
  end 
end
