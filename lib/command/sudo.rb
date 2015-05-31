# sudo.rb - class Sudo

require "#{File.dirname(__FILE__)}/composable"

# TODO: describe Sudo
class Sudo
  include Composable

  def to_s
    'sudo'
  end
end
