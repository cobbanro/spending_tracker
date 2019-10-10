require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative("../models/transaction.rb")
also_reload('../models/*')

get '/transactions/index' do
  @transactions = Transaction.all()
  @total = Transaction.total()
  @tags = Tag.all()
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all()
  @merchant = Merchant.all()
  erb(:"transactions/new")
end

post '/transactions/index' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to('/transactions/index')
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params['id'])
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb(:"transactions/update")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect to('/transactions/index')
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete()
  redirect to('/transactions/index')
end
