# config.rb - loads config file and makes parameters available as methods
require 'yaml'

# TODO: Describe Config
class Config
  def initialize(values={}, *flags)
    @image_name = ''
    @container_name = ''
    @registry = ''
    @tag = ''
    @arg = ''
    @vols_hash = {}

  if flags.first == :preset
    @registry = ENV['USER']
    [:image_name, :container_name].each do |sym|
    method = sym.to_s + '='
      method = method.to_sym
      self.send(method, values[sym]) unless values[sym].nil?
    end
    #@image_name = values[:image_name] unless values[:image_name].nil?
    #@container_name = values[:container_name] unless values[:container_name].nil?
  end
  end

  def self.load(filename)
    File.open(filename, 'r') do |f|
      str = f.read
      @config = YAML.load str
    end
    @config
  end

  attr_reader :image_name

  attr_writer :image_name

  attr_reader :container_name

  attr_writer :container_name

  attr_reader :registry

  attr_writer :registry

  attr_reader :tag

  attr_writer :tag

  attr_reader :arg

  attr_writer :arg

  attr_reader :vols_hash

  attr_writer :vols_hash

  def image_full_name
    "#{registry}/#{image_name}:#{tag}"
  end

  def save(filename)
    File.open(filename, 'w') do |f|
      f.puts YAML.dump self
    end
  end
end
