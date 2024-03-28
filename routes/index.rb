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
