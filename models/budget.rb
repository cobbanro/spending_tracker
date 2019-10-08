require_relative('../db/sql_runner')
require_relative("transaction")

class Budget

  attr_accessor(:total)

  def initialize(total)
    @total = total
  end

  def adjust_budget(transaction_amount)
    @total -= transaction.amount
  end


end
