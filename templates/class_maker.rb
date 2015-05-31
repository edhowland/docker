#!/usr/bin/env ruby
# class_maker.rb - ClassMaker

require './template_maker'

class ClassMaker < TemplateMaker
  def initialize name
    @class_name = name
  end

  def header
    "# #{@class_name.downcase}.rb - Class for #{@class_name}

# TODO: describe #{@class_name}
"
  end
  def spaces number
    spc =''
    number.times do
      spc << ' '
    end
    spc
  end

  def blank
    ''
  end

  def def_class
    "class #{@class_name}"
  end

  def def_method
  "def method_name"
  end

def def_init_method
  "def initialize"
end

  def fin
    'end'
  end

end


def def_class&blk
  [:def_class, yield, :fin]
end

def def_init
  [:def_init_method, :fin]
end

def blank
  [:outdent]
end


def def_method
  [:def_method, :fin]
end


# die if wrong number of args
def die
  puts "Usage : #{__FILE__} class_or_string"
  exit
end

# run the maker code when the program exits
at_exit do
  die if ARGV.length != 1
  maker = ClassMaker.new(ARGV[0])

  s = maker.traverse @tree 

    puts maker.header
  puts s.flatten
end
