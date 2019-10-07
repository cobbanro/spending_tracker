require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/merchant')
require_relative('./models/tag')
require_relative('./models/transaction')
require_relative('./models/merchant_list')
also_reload('./models/*')


get '/home' do
  @merchants = Merchant.all()
  erb(:home)
end

get '/home/new-retailer' do
  erb(:newretailer)
end

post '/home' do
  merchant = MerchantList.new(params)
  merchant.save()
  redirect to('/home')
end

get '/home/new-tag' do
  erb(:newtag)
end

post '/home' do
  tag = Tag.new(params)
  tag.save()
  redirect to('/home')
end
