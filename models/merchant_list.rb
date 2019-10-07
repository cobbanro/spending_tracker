require_relative('../db/sql_runner')
require_relative('transaction')

class MerchantList

  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO merchantlist
    (name)
    VALUES($1)
    RETURNING id'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM merchantlist'
    results = SqlRunner.run(sql)
    return results.map {|hash| MerchantList.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM merchantlist"
    SqlRunner.run(sql)
  end

end
