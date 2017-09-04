class Asset < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploader :picture, PictureUploader

	belongs_to :assetable, polymorphic: true, optional: true
end
