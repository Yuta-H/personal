class CreateSecrets < ActiveRecord::Migration[5.2]
  def change
    create_table :secrets do |t|
      t.string :place
      t.string :password
      t.string :key

      t.timestamps
    end
  end
end
