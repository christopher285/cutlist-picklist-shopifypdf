class AddSizeToCuts < ActiveRecord::Migration
  def change
    add_column :cuts, :size, :string
  end
end
