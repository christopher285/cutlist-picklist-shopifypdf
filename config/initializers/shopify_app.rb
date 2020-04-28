


ShopifyApp.configure do |config|
#development: 
  config.api_key = "your key here"
  config.secret = "your secret here"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
#production:
#  config.api_key = "your key here"
#  config.secret = "your secret here"
#  config.scope = "read_orders, read_products"
#  config.embedded_app = true

end
