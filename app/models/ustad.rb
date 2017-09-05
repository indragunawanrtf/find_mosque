class Ustad < ApplicationRecord
  belongs_to :mesjid, optional: true
  has_many :kajians

  scope :by_mesjid, ->(mesjid_id){ where(mesjid_id: mesjid_id) }

end
