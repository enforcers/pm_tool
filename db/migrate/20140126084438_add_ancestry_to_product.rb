class AddAncestryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ancestry, :string
    add_column :products, :ancestry_depth, :integer, :default => 0
  end
end
