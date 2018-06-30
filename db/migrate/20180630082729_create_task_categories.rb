class CreateTaskCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :task_categories do |t|
      t.references :task
      t.references :category

      t.timestamps
    end
  end
end