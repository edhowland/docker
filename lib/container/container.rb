#  container.rb - class Container

require "#{File.dirname(__FILE__)}/composable"
require "#{File.dirname(__FILE__)}/verb"

class Container
  include Composable

  def initialize(image, name, command, vols_hash={})
  @tmp_str = ''  
  @image=image
    @name=name
    @cmd=command

  @verbs = {}
  @verbs[:start] = Verb.new('start', @name)
  end

  def to_s
 @tmp_str 
  end

  def create
  "create --name='#{@name}' #{@image} #{@cmd}"
  end

  def start
  @tmp_str = @verbs[:start].to_s
  compose
  end
end
