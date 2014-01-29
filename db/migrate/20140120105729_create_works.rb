class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.integer :position
      t.references :project, index: true
      t.integer :parent_id
      t.references :output, index: true

      t.timestamps
    end
  end
end
