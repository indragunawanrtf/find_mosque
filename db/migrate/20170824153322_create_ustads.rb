class CreateUstads < ActiveRecord::Migration[5.1]
  def change
    create_table :ustads do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.text :bidang
      t.string :pekerjaan
      t.integer :user_id
      t.integer :mesjid_id

      t.timestamps
    end
  end
end
