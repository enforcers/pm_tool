class CreatePbs < ActiveRecord::Migration
  def change
    create_table :pbs do |t|
      t.string :name
      t.references :project
      t.references :parent, index: true
      t.integer :depth
      t.integer :order

      t.timestamps
    end
  end
end
