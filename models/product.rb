require 'sinatra'
require 'json'
require 'mongo'

# MongoDB setup (assuming MongoDB is already configured and running)
Mongo::Logger.logger.level = Logger::INFO

# Define Product model
class Product
  include Mongo::Document
  include Mongo::Timestamps

  store_in collection: 'products'

  field :name, type: String
  field :price, type: Float
  field :category, type: String

  # Additional code goes here
  # For example, you could add methods or validations
end

# Define routes
get '/api/products' do
  content_type :json
  products = Product.all
  products.to_json
end

get '/api/products/:id' do
  content_type :json
  product = Product.find(params[:id])
  product.to_json
end

post '/api/products' do
  content_type :json
  data = JSON.parse(request.body.read)
  product = Product.create(data)
  product.to_json
end

put '/api/products/:id' do
  content_type :json
  data = JSON.parse(request.body.read)
  product = Product.find(params[:id])
  product.update(data)
  product.to_json
end

delete '/api/products/:id' do
  content_type :json
  product = Product.find(params[:id])
  product.delete
  { message: 'Product deleted successfully' }.to_json
end
