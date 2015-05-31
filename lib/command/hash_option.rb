# hash_option.rb - HashOption

require "#{File.dirname(__FILE__)}/option"

class HashOption < BinaryOption
  def to_s
    @value.inject('') do |i, v|
      i + (i.empty? ? '' : ' ') + "-#{@name} #{v[0]}:#{v[1]}"
    end
  end
end
