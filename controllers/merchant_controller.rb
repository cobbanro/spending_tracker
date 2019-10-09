require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative("../models/merchant.rb")
also_reload('../models/*')

get "/merchants" do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end

get '/merchants/new' do
  @merchant = Merchant.all()
  erb(:newretailer)
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to('/merchant/index')
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchant/update")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update()
  redirect to('/merchants/index')
end

post '/merchants/:id/delete' do
  merchant = Merchant.find(params['id'])
  merchant.delete()
  redirect to('/merchants/index')
end
