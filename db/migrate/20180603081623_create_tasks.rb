class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :category
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
