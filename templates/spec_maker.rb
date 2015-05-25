#!/usr/bin/env ruby


class SpecMaker
  def initialize name
    @class_name = name
  end

  def header
    "# #{@class_name.downcase}_spec.rb - Spec for #{@class_name}

require 'minitest/autorun'
require './#{@class_name.downcase}'

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

  def describe_class
    "describe #{@class_name} do"
  end

  def describe
    'describe "something" do'
  end

  def before
    'before do'
  end

  def it
    'it "should do something" do'
  end

  def after
    'after do'
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


# die if wrong number of args
def die
  puts "Usage : #{__FILE__} class_or_string"
  exit
end

# run the maker code when the program exits
at_exit do
  die if ARGV.length != 1
  maker = SpecMaker.new(ARGV[0])

  s = maker.traverse @tree 

    puts maker.header
  puts s.flatten
end
