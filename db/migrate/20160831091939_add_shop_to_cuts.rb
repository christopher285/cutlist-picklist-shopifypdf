class AddShopToCuts < ActiveRecord::Migration
  def change
    add_reference :cuts, :shop, index: true, foreign_key: true
  end
end
