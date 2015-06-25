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

  def select field_list
    begin
      db = SQLite3::Database.open(@dbpath)
      rs = db.execute(make_query(field_list))
    ensure
      db.close
    end

    rs.map {|e| @model.new(e) }
  end 
end
