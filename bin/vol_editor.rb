# vol_editor.rb - VolEditor

class VolEditorWorker
  alias_method :a, :add
  alias_method :d, :delete

  def initialize stdin, stdout, hash
    @in = stdin
    @out = stdout
    @hash = hash
  end


def add
  end

  def delete
  end
  def request char
  end
def response
  ''
  end 
  # Read, Eval, Print Loop
  def repl
  @out.puts '(a)dd, (d)elete or (q)uit : '
  command = @in.gets
  end
end

class VolEditor
  def initialize hash={}
    VolEditorWorker.new STDIN, STDOUT, hash
  end
end


