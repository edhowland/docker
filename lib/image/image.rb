# image.rb - class Image to handle docker images
# These are typically found in build/Rakefile

require "#{File.dirname(__FILE__)}/../command" 

class Image
  include Composable

  def initialize(name)
    @name = name

    @tmp_str = ''
    @verbs = {}
  @verbs[:build] = Verb.new('build', '.', BinaryOption.new('t',  @name))
  end

  def name
    @name
  end

  def to_s
    @tmp_str
  end

  def verb sym
    @tmp_str = @verbs[sym].to_s
    compose
  end

  def build
    verb :build
  end
end
