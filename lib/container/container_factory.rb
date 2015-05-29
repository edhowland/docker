# container_factory.rb - ContainerFactory

require "#{File.dirname(__FILE__)}/../tasks/config"
require "#{File.dirname(__FILE__)}/../command"
require "#{File.dirname(__FILE__)}/container"
# rubocop:disable Metrics/LineLength

# TODO: Describe ContainerFactory
class ContainerFactory
  def self.load(root, name)
    config = Config.load("#{root}/#{name}.yml")
    Sudo.new + Docker.new +
      Container.new(config.image_full_name, config.container_name, config.arg, config.vols_hash)
  end
end
