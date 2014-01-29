class CreateResourceAllocations < ActiveRecord::Migration
  def change
    create_table :resource_allocations do |t|
      t.belongs_to :work
      t.belongs_to :resource
      t.column :amount, :float
    end
  end
end
