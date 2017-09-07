class Kajian < ApplicationRecord
  belongs_to :mesjid, optional: true
  belongs_to :ustad, optional: true
  has_many :contributor_updates, as: :contentable

  scope :by_mesjid, ->(mesjid_id){ where(mesjid_id: mesjid_id) }
end
