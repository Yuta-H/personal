class CreatePasswords < ActiveRecord::Migration[5.2]
  def change
    create_table :passwords do |t|
      t.string :password
      t.references :user
      t.references :secret

      t.timestamps
    end
  end
end
