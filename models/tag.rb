require_relative('../db/sql_runner')

class Tag

  attr_reader(:id, :type)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save()
    sql = 'INSERT INTO tags
    (type)
    VALUES($1)
    RETURNING id'
    values = [@type]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def merchant()
    sql = "SELECT merchants.*
    FROM merchants
    INNER JOIN transactions
    ON transactions.merchant_id = merchants.id
    WHERE tag_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |hash| Merchant.new(hash) }
  end

  def self.all()
    sql = 'SELECT * FROM tags'
    results = SqlRunner.run(sql)
    return results.map {|hash| Tag.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end


end
