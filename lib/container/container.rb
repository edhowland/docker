#  container.rb - class Container

require "#{File.dirname(__FILE__)}/composable"
require "#{File.dirname(__FILE__)}/verb"
require "#{File.dirname(__FILE__)}/option"
require "#{File.dirname(__FILE__)}/hash_option"

class Container
  include Composable

  def initialize(image, name, command, vols_hash={})
  @tmp_str = ''  
  @image=image
    @name=name
    @command=command

  @verbs = {}
      @verbs[:create] = MultiArgVerb.new('create', @image, @command, LongOption.new('name', @name))
  @verbs[:start] = Verb.new('start', @name)
  end

  def to_s
 @tmp_str 
  end

  def create
    @tmp_str = @verbs[:create].to_s
   compose
  end

  def start
  @tmp_str = @verbs[:start].to_s
  compose
  end
end
