class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :position
      t.references :project, index: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
