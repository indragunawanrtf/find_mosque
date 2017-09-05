class Mesjid < ApplicationRecord
	belongs_to :user
	has_many :kajians
	has_many :mesjids

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode  # auto-fetch address

	attr_accessor :province_name

	before_validation :set_province
	before_save :set_code

	belongs_to :province
	has_many :kajians
	has_many :assets, as: :assetable

	validates_presence_of :kota, :kecamatan, :name

	accepts_nested_attributes_for :assets, reject_if: :all_blank, allow_destroy: true

	def set_code
		size = Mesjid.where(kota: self.kota, kecamatan: self.kecamatan).size + 1
		self.code = "#{self.kota.downcase.gsub(' ', '-')}_#{self.kecamatan.downcase.gsub(' ', '-')}_#{size}"
	end

	def set_province
		if self.province_name.present?
			self.province_id = Province.find_by(name: self.province_name).try(:id)
		end
	end
end
