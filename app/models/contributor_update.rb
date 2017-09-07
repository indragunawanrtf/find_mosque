class ContributorUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :contentable, polymorphic: true, optional: true
end
