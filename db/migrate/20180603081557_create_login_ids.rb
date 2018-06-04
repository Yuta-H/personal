class CreateLoginIds < ActiveRecord::Migration[5.2]
  def change
    create_table :login_ids do |t|
      t.string :authenticate_key
      t.integer :secret_id

      t.timestamps
    end
  end
end
