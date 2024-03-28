require 'sinatra'
require 'mongo'
require 'json'

# Load configurations
require_relative 'config'

# Connect to MongoDB
client = Mongo::Client.new([CONFIG[:mongo_uri]], :database => 'marketplace')

# Load models
require_relative 'models/product'

# Load routes
require_relative 'routes/index'
