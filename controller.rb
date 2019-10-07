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
  @total = Transaction.total()
  @tags = Tag.all()
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
  tag5 = Tag.new(params)
  tag5.save()
  redirect to('/home')
end

get '/home/new-transaction' do
  @merchantlist = MerchantList.all()
  @tags = Tag.all()
  erb(:newtransaction)
end

post '/home/:id/delete' do
  Merchant.delete(params[:id])
end
