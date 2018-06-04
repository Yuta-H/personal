class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :password
      t.integer :user_id
      t.integer :secret_id

      t.timestamps
    end
  end
end
