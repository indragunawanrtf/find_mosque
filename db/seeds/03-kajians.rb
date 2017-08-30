module SeedKajian
  def self.seed
    kajians = YAML.load_file("#{Rails.root}/db/fixtures/kajian.yml")["kajians"]
    kajians.each do |key, value|
      mesjid_id      = Mesjid.find_by(name: value['name_mesjid']).id
      ustad_id       = Ustad.find_by(name: value['name_ustad']).id
      kajian         = Kajian.find_or_initialize_by(name: value['name'], mesjid_id: mesjid_id, ustad_id: ustad_id)
      kajian.start_at     = value['start_at']
      kajian.end_at       = value['end_at']
      kajian.description  = value['description']
      kajian.user_id      = User.first.id
      kajian.save
    end
  end

end
