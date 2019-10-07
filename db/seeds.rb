require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")
require_relative("../models/merchant_list")
require("pry")

Transaction.delete_all
Merchant.delete_all
Tag.delete_all
MerchantList.delete_all

merchant1 = Merchant.new({'name' => 'tescos'})
merchant2 = Merchant.new({'name' => 'asda'})
merchant1.save
merchant2.save



tag1 = Tag.new({'type' => 'groceries'})
tag2 = Tag.new({'type' => 'beauty'})
tag1.save
tag2.save

transaction1 = Transaction.new({'amount' => 10, 'merchant_id' => merchant1.id, 'tag_id' => tag1.id})
transaction2 = Transaction.new({'amount' => 20, 'merchant_id' => merchant2.id, 'tag_id' => tag1.id})
transaction1.save
transaction2.save

merchantlist1 = MerchantList.new({'name' => 'Sainsburys'})
merchantlist1.save

pry.binding
nil
