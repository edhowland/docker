#  container.rb - class Container

require "#{File.dirname(__FILE__)}/../command"

# TODO: describe Container
class Container < DockerObject
  def initialize(image, name, command, vols_hash = {})
    super(name)
    @image = image
    @command = command
    @vols_hash = vols_hash
    @vols_options = HashOption.new('v', @vols_hash)
    if @vols_hash.empty?
      @verbs[:create] = MultiArgVerb.new('create', @image, @command, LongOption.new('name', @name))
    else
      @verbs[:create] = MultiArgVerb.new('create', @image, @command, LongOption.new('name', @name), @vols_options)

    end
    @verbs[:start] = Verb.new('start', @name)
    @verbs[:rm] = Verb.new('rm', @name)
    @verbs[:wait] = NoArgVerb.new 'wait'
  end

  attr_reader :vols_hash

  def to_s
    @tmp_str
  end

  def verb(sym)
    @tmp_str = @verbs[sym].to_s
    compose
  end

  def create
    verb :create
  end

  def start
    verb :start
  end

  def wait
    verb :wait
  end

  def start_then_wait
    "sha=$(#{start}); #{wait} ${sha}"
  end

  def rm
    verb :rm
  end
end
