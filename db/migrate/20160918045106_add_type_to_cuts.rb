class AddTypeToCuts < ActiveRecord::Migration
  def change
    add_column :cuts, :type, :string
  end
end
