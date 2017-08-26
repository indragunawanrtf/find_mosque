class Ustad < ApplicationRecord
  belongs_to :mesjid
  has_many :kajians

  scope :by_mesjid, ->(mesjid_id){ where(mesjid_id: mesjid_id) }

end
