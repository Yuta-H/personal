class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.string :reference
      t.string :solution
      t.references :user

      t.timestamps
    end
  end
end
