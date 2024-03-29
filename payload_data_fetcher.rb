require 'httparty'

class PayloadDataFetcher
  include HTTParty
  base_uri 'https://your-payload-cms-api.com'

  def fetch_products
    response = self.class.get('/api/products')
    return JSON.parse(response.body)
  end
end

# Example usage:
# payload_fetcher = PayloadDataFetcher.new
# products = payload_fetcher.fetch_products
# puts products
