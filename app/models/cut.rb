class Cut < ActiveRecord::Base
# include ShopifyApp::Shop
# include ShopifyApp::SessionStorage
belongs_to :shop
belongs_to :list
#validates_uniqueness_of :product, :scope => :orderid 
end
