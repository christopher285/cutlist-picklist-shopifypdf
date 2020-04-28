class CreateCuts < ActiveRecord::Migration
  def change
    create_table :cuts do |t|
      t.string :orderid
      t.text :product
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
