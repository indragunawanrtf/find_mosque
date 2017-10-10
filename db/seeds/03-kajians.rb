module SeedKajian
  def self.seed
    seed_for_dummy
    # kajians = YAML.load_file("#{Rails.root}/db/fixtures/kajian.yml")["kajians"]
    # kajians.each do |key, value|
    #   mesjid_id      = Mesjid.find_by(name: value['name_mesjid']).id
    #   ustad_id       = Ustad.find_by(name: value['name_ustad']).id
    #   kajian         = Kajian.find_or_initialize_by(name: value['name'], mesjid_id: mesjid_id, ustad_id: ustad_id)
    #   kajian.start_at     = value['start_at']
    #   kajian.end_at       = value['end_at']
    #   kajian.description  = value['description']
    #   kajian.user_id      = User.first.id
    #   kajian.save
    # end
  end

  def self.seed_for_dummy
    mesjids = Mesjid.all
    kajians = ['Kajian Kitab', 'Bedah Buku', 'Tadabur Quran', 'Tanya Jawab']
    mesjids.each do |msj|
      ustad_id = msj.ustads.sample.try(:id)
      mesjid_id = msj.id
      name = kajians.sample
      kajian  = Kajian.find_or_initialize_by(name: name, mesjid_id: mesjid_id, ustad_id: ustad_id)
      kajian.start_at     = (DateTime.now.beginning_of_month...DateTime.now.end_of_month).to_a.sample + (7..19).to_a.sample.hours
      kajian.end_at       = kajian.start_at + (1..3).to_a.sample.hours
      kajian.description  = "#{kajian.name} adalah kajian rutin yang di isi oleh #{kajian.ustad.name} dalam bidang #{kajian.ustad.bidang} di #{kajian.mesjid.name}"
      kajian.user_id      = User.first.id
      kajian.save    
    end
  end

end
