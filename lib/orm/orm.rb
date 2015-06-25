# orm.rb - class Orm

class Orm
  def initialize dbpath, model
    @dbpath = dbpath
    @model = model
  end

  def table_name
    snake_case @model.name
  end

  def select fields_str
    [@model.new([])]
  end 
end
