class CreateKajians < ActiveRecord::Migration[5.1]
  def change
    create_table :kajians do |t|
      t.string :name
      t.text :description
      t.integer :mesjid_id
      t.integer :ustad_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :user_id

      t.timestamps
    end
  end
end
