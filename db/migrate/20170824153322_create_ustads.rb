class CreateUstads < ActiveRecord::Migration[5.1]
  def change
    create_table :ustads do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
