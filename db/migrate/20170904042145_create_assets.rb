class CreateAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :assets do |t|
      t.integer :assetable_id
      t.string :assetable_type
      t.string :picture

      t.timestamps
    end
  end
end
