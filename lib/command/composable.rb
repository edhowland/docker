
module Composable
  #@previous

  def prev=(value)
    @previous = value
  end

  def prev
    @previous
  end

  def +(that)
    that.prev = (self)
    that
  end

  def compose
    (prev.nil? ? '' : prev.compose + ' ') + to_s
  end
end
