require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative("./controllers/tag_controller")
require_relative('./models/merchant')
require_relative('./models/tag')
require_relative('./models/transaction')
also_reload('./models/*')
