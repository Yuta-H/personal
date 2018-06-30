class CreateTroubleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :trouble_categories do |t|
      t.references :trouble
      t.references :category

      t.timestamps
    end
  end
end