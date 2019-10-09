require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative("../models/transaction.rb")
also_reload('../models/*')

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  @tags = Tag.all()
  erb(:home)
end

get '/transactions/new' do
  @tags = Tag.all()
  @merchant = Merchant.all()
  erb(:transactions)
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/home')
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:updatetransaction)
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect to('/transactions')
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete()
  redirect to('/home')
end
