class CreateChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :checklists do |t|
      t.string :title
      t.integer :service_id
      t.integer :wedding_id
      t.string :status
      t.datetime :date
      t.text :note

      t.timestamps
    end
  end
end
