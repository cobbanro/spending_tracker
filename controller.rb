require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/merchant')
require_relative('./models/tag')
require_relative('./models/transaction')
also_reload('./models/*')


get '/home' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  @tags = Tag.all()
  erb(:home)
end

get '/home/new-retailer' do
  erb(:newretailer)
end

post '/merchant' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to('/home')
end

get '/home/new-tag' do
  erb(:newtag)
end

post '/tag' do
  tag5 = Tag.new(params)
  tag5.save()
  redirect to('/home')
end

get '/home/new-transaction' do
  @tags = Tag.all()
  @merchant = Merchant.all()
  erb(:newtransaction)
end

post '/transaction' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/home')
end

get '/home/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @tags = Tag.all()
  @merchant = Merchant.all()
  erb(:updatetransaction)
end

post '/home/:id' do
  transaction = Transaction.find(params['id'])
  transaction.update()
  redirect to('/home')
end

post '/home/:id/delete' do
  transaction = Transaction.find(params['id']) #needs find method in model.
  transaction.delete()
  redirect to('/home')
end

get 'home/budget' do

end
