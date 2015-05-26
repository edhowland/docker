def file_write file
  file.open('file.txt', 'w')  do |f|
    f.puts 'hello'
  end
end
