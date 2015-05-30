# option.rb - Option

# TODO: Describe Option
class Option
  def initialize
  end

  def to_s
    ''
  end
end

# TODO: Describe UnaryOptopn
class UnaryOption < Option
  def initialize(value)
    @value = value
  end

  def to_s
    "-#{@value}"
  end
end

# TODO: Describe LongOption
class LongOption < Option
  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "--#{@name}='#{@value}'"
  end
end

# TODO: Describe BinaryOption
class BinaryOption < Option
  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "-#{@name} \"#{@value}\""
  end
end
