# orm.rb - class Orm

class Orm
  def initialize dbpath, model
    @dbpath = dbpath
    @model = model
  end

  def table_name
    snake_case @model.name
  end

  def make_query field_list, clauses={}
  filter = clauses.map {|e| "#{e[0].upcase} #{e[1]}" }.join(' ')
    "SELECT #{field_list} FROM #{table_name}" + (filter.empty? ? '' : ' ' + filter)
  end

  def select field_list, clauses={}
    db_execute field_list, clauses
  end

  def db_execute field_list, clauses={}
    begin
      db = SQLite3::Database.open(@dbpath)
      rs = db.execute(make_query(field_list, clauses))
    ensure
      db.close
    end

    rs.map {|e| @model.new(e) }
  end 

  def select_fields clauses={}
    select @model.new([]).field_list, clauses
  end
end
