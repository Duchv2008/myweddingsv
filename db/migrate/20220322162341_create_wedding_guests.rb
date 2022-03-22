class CreateWeddingGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :wedding_guests do |t|
      t.integer :wedding_id
      t.string :phone
      t.string :name
      t.string :email
      t.string :gender
      t.integer :attachments
      t.boolean :is_join
      t.boolean :is_attended_their_wedding
      t.string :money_you_send
      t.string :money_you_receive
      t.text :note

      t.timestamps
    end
  end
end
