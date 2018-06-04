class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :name
      t.integer :task_id
      t.integer :trouble_id

      t.timestamps
    end
  end
end
