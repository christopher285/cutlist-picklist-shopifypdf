class AddDoneToCuts < ActiveRecord::Migration
  def change
    add_column :cuts, :done, :boolean, null: false, default: false
  end
end
