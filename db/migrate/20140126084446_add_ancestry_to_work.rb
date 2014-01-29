class AddAncestryToWork < ActiveRecord::Migration
  def change
    add_column :works, :ancestry, :string
    add_column :works, :ancestry_depth, :integer, :default => 0
  end
end
