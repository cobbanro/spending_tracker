require_relative('../db/sql_runner')
require_relative("tag")
require_relative("merchant")

class Transaction

  attr_reader(:id, :amount, :merchant_id, :tag_id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@amount, @merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM transactions'
    results = SqlRunner.run(sql)
    return results.map {|hash| Transaction.new(hash)}
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.total
    sql = 'SELECT amount FROM transactions'
    results = SqlRunner.run(sql)
    array = results.map {|hash| Transaction.new(hash)}
    amount = 0
    array.each{|turtle| amount += turtle.amount}
    return amount
  end
end
