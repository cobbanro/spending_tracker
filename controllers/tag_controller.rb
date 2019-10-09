require_relative("../models/tag.rb")

get "/tags" do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do
  erb(:newtag)
end

post '/tags' do
  tag = Tag.new(params)
  tag.save()
  redirect to('/home')
end
