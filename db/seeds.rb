require_relative( "../models/merchant" )
require_relative( "../models/tag" )
require_relative( "../models/transaction" )
require("pry")

merchant1 = Merchant.new({'name' => 'tescos'})
merchant1.save()

tag1 = Tag.new({'type' => 'groceries'})
tag1.save()

pry.binding
nil
