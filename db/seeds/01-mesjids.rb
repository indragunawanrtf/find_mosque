require 'open-uri'

module SeedMesjid
  def self.seed
    manual_get_mesjid
    # default_url = "https://www.dream.co.id/sim/"
    # get_data_province = get_province(default_url)
    # provinces = Province.all
    # provinces.each do |prov|
    #   mesjid_url = default_url + prov.name.downcase.gsub(' ', '-')
    #   puts "Get data to #{mesjid_url}"
    #   data_mesjid_province = Nokogiri::HTML(open(mesjid_url))
    #   mesjids = data_mesjid_province.css('.table-daftar-masjid tbody').children
    #   mesjids.each do |ms|
    #     data = ms.children
    #     next if data.blank?
    #     get_mesjid(data)
    #   end
    # end
  end

  def self.manual_get_mesjid
    mesjids = YAML.load_file("#{Rails.root}/db/fixtures/mesjid.yml")["mesjids"]
    mesjids.each do |key, value|
      province_id    = Province.find_or_create_by(name: value['province']).id
      mesjid         = Mesjid.find_or_initialize_by(name: value['name'], province_id: province_id, kota: value['kota'], kecamatan: value['kecamatan'])
      mesjid.alamat  = value['alamat']
      mesjid.description = value['description']
      mesjid.jenis   = value['jenis']
      mesjid.status_tanah  = value['status_tanah']
      mesjid.open_time     = value['open_time']
      mesjid.close_time    = value['close_time']
      mesjid.tahun_berdiri = value['tahun_berdiri']
      mesjid.latitude      = value['latitude']
      mesjid.longitude     = value['longitude']
      mesjid.save
    end
  end

  def self.get_province(default_url)
    html = Nokogiri::HTML(open(default_url))
    select_province = html.css('#province')
    select_provinces = select_province.children
    select_provinces.each do |prov|
      right_data = prov.text != "Semua Provinsi" && prov.text != "\n                                    \t" && prov.text != "\n\t\t\t\t\t\t\t\t\t\t" && prov.text != "\n                                    "
      Province.find_or_create_by(name: prov.text) if right_data
    end
  end

  def self.get_mesjid(data)
    province_id = Province.find_by(name: data[13].text.upcase).try(:id)
    mesjid = Mesjid.find_or_initialize_by(name: data[3].text, province_id: province_id, kota: data[9].text, kecamatan: data[11].text)
    mesjid.jenis = data[15]
    mesjid.status_tanah = data[17]
    mesjid.user_id = User.first.id
    mesjid.save
  end
end
