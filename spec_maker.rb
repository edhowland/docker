#!/usr/bin/env ruby

spec = [:describe,
[:before,
 :fin],
[:it,
:fin],
:fin]


class SpecMaker
  def spaces number
    spc =''
    number.times do
      spc << ' '
    end
    spc
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
  def fin
    'end'
  end

  def traverse tree,indent=0
    tree.map do |e|
      if e.instance_of? Array
        traverse(e, indent +2)
  else
spaces(indent) + e.to_s
      end
    end
  end
end

maker = SpecMaker.new

s = maker.traverse spec

puts s.flatten
