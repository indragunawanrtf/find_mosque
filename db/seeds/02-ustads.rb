module SeedUstad
  def self.seed
    seed_for_dummy
    # ustads = YAML.load_file("#{Rails.root}/db/fixtures/ustad.yml")["ustads"]
    # ustads.each do |key, value|
    #   mesjid_id      = Mesjid.find_by(name: value['name_mesjid']).id
    #   ustad          = Ustad.find_or_initialize_by(name: value['name'], mesjid_id: mesjid_id)
    #   ustad.bidang       = value['bidang']
    #   ustad.pekerjaan    = value['pekerjaan']
    #   ustad.description  = value['description']
    #   ustad.user_id      = User.first.id
    #   ustad.save
    # end
  end

  def self.seed_for_dummy
    mesjids = Mesjid.all
    bidangs = ['Sirah', 'Tauhid', 'Motivasi', 'Hadist', 'Quran', 'Tafsir']
    pekerjaans = ['Penulis', 'Motivator', 'Pembisnis', 'Imam', 'Dosen', 'Penceramah']
    gelars = ['Ustad', 'Habib', 'Doktor', 'Mualim']
    names = ['Bachtiar', 'Natsir', 'Adi', 'Hidayat', 'Subhan', 'Abdul', 'Somad']
    mesjids.each do |msj|
      bidang            = bidangs.sample
      pekerjaan         = pekerjaans.sample
      gelar             = gelars.sample
      name              = names.sample
      mesjid_id         = msj.id
      ustad             = Ustad.find_or_initialize_by(name: "#{gelar} #{name}", mesjid_id: mesjid_id)
      ustad.bidang      = bidang
      ustad.pekerjaan   = pekerjaan
      ustad.description = "Nama #{ustad.name} adalah seorang #{gelar} yang ahli dalam bidang keilmuan #{bidang} disamping menjadi seorang #{gelar} beliau pun melakukan sebagai seorang #{pekerjaan} yang sering berada di #{ustad.mesjid.name}"
      ustad.user_id     = User.first.id
      ustad.save
    end
  end

end
