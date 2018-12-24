class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :category
      t.references :status
      t.boolean :delete_flg
      t.references :user, null: false

      t.timestamps
    end
  end
end
