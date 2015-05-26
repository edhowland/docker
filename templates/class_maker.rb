#!/usr/bin/env ruby
# class_maker.rb - ClassMaker


class ClassMaker
  def initialize name
    @class_name = name
  end

  def header
    "# #{@class_name.downcase}_spec.rb - Spec for #{@class_name}


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

def init_method
  "def initialize()"
end

  def fin
    'end'
  end

  def traverse tree,indent=0
    tree.map do |e|
      if e.instance_of? Array
        traverse(e, indent +2)
  else
spaces(indent) + self.send(e)
      end
    end
  end
end


def describe_class&blk
  [:describe_class, yield, :fin]
end
def describe_method  &blk
  [:describe, yield, :fin]
end

def describe_something &blk
  [:describe, yield, :fin]
end

def before_maker
  [:before, [:blank], :fin]
end

def it_maker
  [:it, [:blank], :fin]
end

def after_maker
  [:after, [:blank], :fin]
end

def around_method &blk
  before_maker + yield + after_maker
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
