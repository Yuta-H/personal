class CreateTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :troubles do |t|
      t.string :url
      t.string :example
      t.string :solution

      t.timestamps
    end
  end
end
