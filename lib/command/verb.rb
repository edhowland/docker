# verb.rb - Verb

# TODO: Describe Verb
class Verb
  def initialize(name, arg, *flags)
    @name = name
    @arg = arg
    @flags = flags

    @value = make_values(@name, @flags, @arg)
  end

  def make_values(name, flags, *args)
    values = [name]
    values << flags.join(' ') unless flags.empty?
    values << args.join(' ') unless args.empty?
    values
  end

  def to_s
    @value.join(' ')
  end
end

# TODO: Describe NoArgVerb
class NoArgVerb < Verb
  def initialize(name, *flags)
    @name = name
    @flags = flags
    @value = make_values(@name, @flags)
  end
end

# TODO: Describe MultiArgVerb
class MultiArgVerb < Verb
  def initialize(name, arg1, arg2, *flags)
    @name = name
    @arg1 = arg1
    @arg2 = arg2
    @flags = flags
    @value = make_values(@name, @flags, @arg1, @arg2)
  end
end
