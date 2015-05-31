# image_factory.rb - ImageFactory

require "#{File.dirname(__FILE__)}/../command"
require "#{File.dirname(__FILE__)}/image"
require "#{File.dirname(__FILE__)}/../tasks/config"

class ImageFactory
  def self.load(root, name)
    config = Config.load("#{root}/#{name}.yml")
    image = Sudo.new + Docker.new + Image.new(config.image_full_name)
    image
  end
end
