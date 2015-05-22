def ijtr(hash)
  hash.inject('') { |str, arr| str + " -v #{arr[0]}:#{arr[1]}" }
end
h = {}
h['/opt/etc'] = '/data/etc'
h['/tmp/data'] = '/data'

puts ijtr(h)
