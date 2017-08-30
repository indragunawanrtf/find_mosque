class CreateMesjids < ActiveRecord::Migration[5.1]
  def change
    create_table :mesjids do |t|
      t.string :name
      t.text :description
      t.string :kota
      t.string :kecamatan
      t.string :code
      t.text :address
      t.decimal :latitude
      t.decimal :longitude
      t.string :tahun_berdiri
      t.string :jenis
      t.string :status_tanah
      t.integer :province_id
      t.time :open_time
      t.time :close_time
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
