class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :listnumber

      t.timestamps null: false
    end
  end
end
