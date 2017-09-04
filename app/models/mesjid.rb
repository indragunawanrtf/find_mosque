class Mesjid < ApplicationRecord
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode  # auto-fetch address

  # require 'carrierwave/orm/activerecord'

  # mount_uploader :picture, PictureUploader

	before_save :set_code

	belongs_to :province
	has_many :kajians

	def set_code
		size = Mesjid.where(kota: self.kota, kecamatan: self.kecamatan).size + 1
		self.code = "#{self.kota.downcase.gsub(' ', '-')}_#{self.kecamatan.downcase.gsub(' ', '-')}_#{size}"
	end
end
