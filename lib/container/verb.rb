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

