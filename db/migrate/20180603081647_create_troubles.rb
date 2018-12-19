class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.string :url
      t.string :name
      t.references :category
      t.references :status
      t.string :solution
      t.reference :user, null: false

      t.timestamps
    end
  end
end
