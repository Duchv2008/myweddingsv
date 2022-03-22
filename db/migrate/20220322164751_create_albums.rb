class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.integer :wedding_id
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
