require_relative('../db/sql_runner')

class Merchant

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO merchants
    (name)
    VALUES($1)
    RETURNING id'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM merchants'
    results = SqlRunner.run(sql)
    return results.map {|hash| Merchant.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

end
