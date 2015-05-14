# std_file_mock.rb - mocks for stdin, stout

module Workable
  @worked = false

  def start
    @worked = false
  end
  def worked?
    @worked
  end

  def work
    @worked = true
  end
end


class StdinMock
  include Workable
  def initialize string
 start 
    @string = string
  end

def gets
  work
    @string
  end
end

class StdoutMock
  include Workable
  def initialize
  start
    @string = ''
  end

  def puts string
  work
    @string = string
  end

  def string
  @string
  end
end
