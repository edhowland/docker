# orm.rb - class Orm

class Orm
  def initialize dbpath, model
    @dbpath = dbpath
    @model = model
  end

  def select fields_str
    [@model.new([])]
  end 
end
