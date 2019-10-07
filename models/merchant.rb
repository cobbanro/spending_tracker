require_relative('../db/sql_runner')
require_relative('transaction')

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

  def tag()
    sql = "SELECT tags.*
    FROM tags
    INNER JOIN transactions
    ON transactions.tag_id = tags.id
    WHERE merchant_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |hash| Tag.new(hash) }
  end

  def transaction()
    sql = "SELECT amount FROM transactions WHERE merchant_id = $1"
    values = [@id]
    return SqlRunner.run(sql,values).first['amount'].to_i
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

  def self.destroy(id)
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
