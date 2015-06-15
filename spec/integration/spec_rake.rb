# specrake.rb - Class for SpecRake

# TODO: describe SpecRake
class SpecRake
  def initialize dir
    @dir = dir
    FileUtils.cd(@dir) do
      @rake = Rake.application
      @rake.init
      @rake.load_rakefile
    end
  end

  def method_missing sym
    FileUtils.cd(@dir) do
      @rake.invoke sym.to_s
    end
  end
end
