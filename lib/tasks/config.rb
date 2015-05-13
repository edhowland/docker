# config.rb - loads config file and makes parameters available as methods
require 'yaml'

class Config
  @image_name
  @container_name
  @registry
  @tag
  @vols_hash={}

  def initialize
    @image_name = ''
    @container_name = ''
   @registry = ''
    @tag = ''
    @vols_hash = {}
  end

   def self.load(filename)
    File.open(filename, 'r') do |f|
      str = f.read
      @config = YAML.load str
    end
    @config
  end

  def image_name
    @image_name
  end

  def image_name=(name)
    @image_name = name
  end

  def container_name
    @container_name
  end

  def container_name=(name)
    @container_name = name
  end

  def registry
    @registry
  end

  def registry=(name)
    @registry = name
end

  def tag
    @tag
  end

  def tag=(name)
    @tag= name
  end

  def vols_hash
    @vols_hash
  end

  def vols_hash=(hash)
    @vols_hash = hash
  end

  def save(filename)
    File.open(filename, 'w') do |f|
      f.puts YAML.dump self
    end
  end
end


