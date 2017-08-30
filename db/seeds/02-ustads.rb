module SeedUstad
  def self.seed
    ustads = YAML.load_file("#{Rails.root}/db/fixtures/ustad.yml")["ustads"]
    ustads.each do |key, value|
      mesjid_id      = Mesjid.find_by(name: value['name_mesjid']).id
      ustad          = Ustad.find_or_initialize_by(name: value['name'], mesjid_id: mesjid_id)
      ustad.bidang       = value['bidang']
      ustad.pekerjaan    = value['pekerjaan']
      ustad.description  = value['description']
      ustad.user_id      = User.first.id
      ustad.save
    end
  end

end
