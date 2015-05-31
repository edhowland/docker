
# TODO: Describe Composable
module Composable
  def prev=(value)
    @previous = value
  end

  def prev
    @previous
  end

  def +(other)
    other.prev = (self)
    other
  end

  def compose
    (prev.nil? ? '' : prev.compose + ' ') + to_s
  end
end
