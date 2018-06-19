class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.string :name
      t.references :task
      t.references :trouble

      t.timestamps
    end
  end
end
