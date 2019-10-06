require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/merchant')
require_relative('./models/tag')
require_relative('./models/transaction')
also_reload('./models/*')

get '/home' do
  @merchant = Merchant.all()
  erb(:home)
end

get '/home/new-retailer' do
  erb(:newretailer)
end
