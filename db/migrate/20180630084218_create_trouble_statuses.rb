class CreateTroubleStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :trouble_statuses do |t|
      t.references :trouble
      t.references :status

      t.timestamps
    end
  end
end
