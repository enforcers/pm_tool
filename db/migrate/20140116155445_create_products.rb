class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :depth
      t.integer :place
      t.references :project, index: true
      t.references :parent, index: true

      t.timestamps
    end
  end
end
