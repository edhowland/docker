# template_maker.rb - super class for ClassMaker and SpecMaker

class TemplateMaker
  def initialize  name
    @class_name = name
  end

  def traverse tree,indent=0
    tree.map do |e|
      if e.instance_of? Array
        traverse(e, indent +2)
  else
      if e == :outdent
        ''
      else
  spaces(indent) + self.send(e)
        end
      end
    end
  end
end
