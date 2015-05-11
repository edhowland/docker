# verb.rb - Verb

class Verb
  def initialize(name, arg, *flags)
    @name=name
    @arg=arg
    @flags=flags

    @value = [@name]
  @value << @flags.join(' ') if !@flags.empty?
    @value << @arg
    end

  def to_s
    @value.join(' ')
  end
end


class MultiArgVerb < Verb
  def initialize name, arg1, arg2, *flags
    @name=name
  @arg1=arg1
  @arg2=arg2
  @flags=flags
  @value = [@name]
  @value << @flags.join(' ') unless @flags.empty?
    @value << @arg1
  @value << @arg2
  end
end
