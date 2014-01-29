class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.integer :group
      t.string :qualification
      t.string :experience
      t.float :fte
      t.integer :position
      t.references :project, index: true

      t.timestamps
    end
  end
end
