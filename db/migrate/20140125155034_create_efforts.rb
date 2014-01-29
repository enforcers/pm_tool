class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.references :work, index: true
      t.integer :method
      t.string :name
      t.float :estimation

      t.timestamps
    end
  end
end
