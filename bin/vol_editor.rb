# vol_editor.rb - VolEditor
@finish = false

class VolEditorWorker
  
  def initialize stdin, stdout, hash
    @in = stdin
    @out = stdout
    @hash = hash
    @arr = @hash.to_a
  end

  def display
    @out.puts "Host Dir\tmaps to\tContainer Dir"
    @arr.inject(1) do |i, j|
      @out.puts "#{i}: #{j[0]}\t->\t#{j[1]}"
    i + 1
    end
  end

def add
  @out.print 'Host dir : '
    host = @in.gets.chomp
    @out.print 'Container dir : '
    container = @in.gets.chomp
    @arr << [host, container]
  end

  def delete
  @out.print '# to delete? : '
  check = 1..@arr.length
    val = @in.gets.chomp
    val = val.to_i
@out.puts 'Illegal number' unless check.member? val
    @arr.delete_at (val - 1) if check.member? val
  
  end 

  def quit
    @out.puts 'Quitting.'
@finish = true
    @hash = @arr.to_h
  end
    alias_method :a, :add
    alias_method :d, :delete
  alias_method :q, :quit
    
def prompt
    "(a)dd#{@arr.length > 0 ? '(d)elete, ' : ''} or (q)uit : "
  end

# syntax check inpu
  def syntax_ok?
    regex = (@arr.length > 0 ? /^[aAdDqQ]/ : /^[aAqQ]/)
    @command =~ regex
  end


  # process command
  def process
  c = @command.chomp
    c = c[0].downcase
  c = c.to_sym
  self.send c
  end
  # Read, Eval, Print Loop
  def repl
    until @finish do
      display
    @out.print prompt
    @command = @in.gets
  @out.puts 'I do not understand that' unless syntax_ok?
    process if syntax_ok?
    end
    @hash
  end
end

class VolEditor < VolEditorWorker
  def initialize hash={}
     super(STDIN, STDOUT, hash)
  end
end


