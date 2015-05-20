# option.rb - Option

class Option
  def initialize
  end

  def to_s
    ''
  end
end

class UnaryOption < Option
  def initialize value
    @value = value
  end

  def to_s
    "-#{@value}"
  end
end

class LongOption < Option
  def initialize(name, value)
    @name = name
    @value = value
  end

  def to_s
    "--#{@name}='#{@value}'"
  end
end

class BinaryOption < Option
  def initialize(name, value)
  @name=name
  @value=value
  end

  def to_s
    "-#{@name} \"#{@value}\""
  end
end
