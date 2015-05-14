# vol_editor.rb - VolEditor

class VolEditorWorker
  def initialize stdin, stdout, hash
    @in = stdin
    @out = stdout
    @hash = hash
  end

  # Read, Eval, Print Loop
  def repl
  @out.puts '(a)dd, (d)elete or (q)uit : '
  command = @in.gets
  end
end
