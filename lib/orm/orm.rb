# orm.rb - class Orm

class Orm
  def initialize dbpath, model
    @dbpath = dbpath
    @model = model
  end
# return the model name or the table name if it a string

  def table_name
    if @model.instance_of? String
      @model
    else
      snake_case @model.name
    end
  end

  def make_query field_list, clauses={}
  filter = clauses.map {|e| "#{e[0].upcase} #{e[1]}" }.join(' ')
    "SELECT #{field_list} FROM #{table_name}" + (filter.empty? ? '' : ' ' + filter)
  end

  def select field_list, clauses={}
    rs = db_execute field_list, clauses
    rs.map {|e| @model.new(e) }
  end

  def db_execute field_list, clauses={}
    begin
      db = SQLite3::Database.open(@dbpath)
      rs = db.execute(make_query(field_list, clauses))
    ensure
      db.close
    end

    rs
  end 

  def select_fields clauses={}
    select @model.new([]).field_list, clauses
  end
end
