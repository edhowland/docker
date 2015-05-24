#!/usr/bin/env ruby


class SpecMaker
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


def class_maker streing, &blk
  [:describe, yield, :fin]
end
def method_maker string, &blk
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

tree = class_maker('object') do
  method_maker('action') do
    before_maker + it_maker + after_maker
  end
end


maker = SpecMaker.new

s = maker.traverse tree #  spec

puts s.flatten
