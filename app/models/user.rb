class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,  :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :auth_tokens
  has_many :kajians
  has_many :mesjids
  has_many :ustads
  has_many :contributor_updates

  class << self
		
		def login(username, password)
	    user = find_by_username(username)
	    return nil unless user
	    user.valid_password?(password) ? user : nil
	  end

		def find_by_access_token(token)
		  eager_load(:auth_tokens).where('auth_tokens.token = ?', token).first
		end

	end

  def success_login(device, os, os_version, app_version)
    auth_token = self.auth_tokens.find_or_create_by(device: device)
    auth_token.update_columns(os: os, os_version: os_version, app_version: app_version)
  end

  def update_password password, password_confirmation
    self.password = password
    self.password_confirmation = password_confirmation
    self.save
  end

end