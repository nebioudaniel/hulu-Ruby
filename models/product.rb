class Product
  include Mongo::Document
  include Mongo::Timestamps

  store_in collection: 'products'

  field :name, type: String
  field :price, type: Float
  field :category, type: String
end
