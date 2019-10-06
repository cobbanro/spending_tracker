require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
also_reload('../models/*')

get '/' do
  @merchant = Merchant.all
  erb(:home)
end
