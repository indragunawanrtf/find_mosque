class Kajian < ApplicationRecord
  belongs_to :mesjid
  belongs_to :ustad

  scope :by_mesjid, ->(mesjid_id){ where(mesjid_id: mesjid_id) }
end
