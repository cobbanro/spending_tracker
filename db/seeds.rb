require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")
require("pry")

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

merchant1 = Merchant.new({'name' => 'tescos'})
merchant2 = Merchant.new({'name' => 'asda'})
merchant3 = Merchant.new({'name' => 'boots'})
merchant1.save
merchant2.save
merchant3.save



tag1 = Tag.new({'type' => 'groceries'})
tag2 = Tag.new({'type' => 'beauty'})
tag1.save
tag2.save

transaction1 = Transaction.new({'amount' => 10, 'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction2 = Transaction.new({'amount' => 20, 'merchant_id' => merchant2.id, 'tag_id' => tag1.id})
transaction2 = Transaction.new({'amount' => 14, 'merchant_id' => merchant3.id, 'tag_id' => tag2.id})
transaction1.save
transaction2.save
transaction3.save

binding.pry
nil
