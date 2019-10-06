require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")
require("pry")

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.new({'name' => 'tescos'})
merchant1.save



tag1 = Tag.new({'type' => 'groceries'})
tag1.save

transaction1 = Transaction.new({'amount' => 10, 'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction1.save

pry.binding
nil
