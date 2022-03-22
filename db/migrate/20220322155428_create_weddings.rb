class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings do |t|
      t.integer :owner_id
      t.string :owner_name
      t.string :owner_gender
      t.string :partner_name
      t.string :partner_gender
      t.string :partner_email
      t.string :partner_phone
      t.string :wedding_name
      t.datetime :wedding_time

      t.timestamps
    end
  end
end
