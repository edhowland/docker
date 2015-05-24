#!/usr/bin/env ruby

spec = [:describe,
[:before,
 :fin],
[:it,
finend],
finend]


class SpecMaker
  def traverse tree,indent=0
    tree.map do |e|
      if e.instance_of? Array
        traverse(e, indent +2)
  else
e.to_s
      end
    end
  end
end

maker = SpecMaker.new

s = maker.traverse spec

puts s.flatten
