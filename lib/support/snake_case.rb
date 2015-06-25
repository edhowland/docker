# snake_case.rb - method snake_case

def snake_case string
  string =~ /([A-Z].*)([A-Z].*)/
  "#{$1.downcase}_#{$2.downcase}"
end
