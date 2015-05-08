# container.rb - requires all the lib/containers

Dir('container/*') do |f|
  #require "#{File.dirname(__FILE__)}/container/#{f}"
  puts f
end

