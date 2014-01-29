class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.date :start_at
      t.date :end_at
      t.references :project, index: true

      t.timestamps
    end
  end
end
