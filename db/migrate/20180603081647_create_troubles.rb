class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.string :reference
      t.string :solution
      t.integer :user_id

      t.timestamps
    end
  end
end
