# image.rb - class Image to handle docker images
# These are typically found in build/Rakefile

require "#{File.dirname(__FILE__)}/../command"

# TODO: describe Image
class Image < DockerObject
  def initialize(name)
    super(name)
    @verbs[:build] = Verb.new('build', '.', BinaryOption.new('t',  @name))
    @verbs[:rmi] = Verb.new('rmi', @name)
  end

  attr_reader :name

  def to_s
    @tmp_str
  end

  def verb(sym)
    @tmp_str = @verbs[sym].to_s
    compose
  end

  def build
    verb :build
  end

  def rmi
    verb :rmi
  end
end
