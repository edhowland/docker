# orm.rb - class Orm

class Orm
  def initialize dbpath, model
    @dbpath = dbpath
    @model = model
  end

  def table_name
    snake_case @model.name
  end

  def make_query field_list
    "SELECT #{field_list} FROM #{table_name}"
  end

  def select fields_str
    [@model.new([])]
  end 
end
