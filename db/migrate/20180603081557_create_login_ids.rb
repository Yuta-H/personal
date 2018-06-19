class CreateLoginIds < ActiveRecord::Migration[5.2]
  def change
    create_table :login_ids do |t|
      t.string :authenticate_key
      t.references :secret

      t.timestamps
    end
  end
end
