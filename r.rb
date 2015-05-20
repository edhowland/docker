
puts 'done'

at_exit do
 # puts 'bad' # unless $!.nil? || $!.is_a? SystemExit
  puts 'bad' if $!.is_a? RuntimeError
end

 raise 'JuJu'
