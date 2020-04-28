class AddListToCuts < ActiveRecord::Migration
  def change
    add_reference :cuts, :list, index: true, foreign_key: true
  end
end
