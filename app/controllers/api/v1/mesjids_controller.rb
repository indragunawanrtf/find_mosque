class Api::V1::MesjidsController < Api::ApplicationController

	def index
		if params[:all].present? || (request.headers['latitude'].blank? && request.headers['longitude'].blank?)
			@mesjids = Mesjid.page
		else
			@mesjids = Mesjid.near([request.headers['latitude'], request.headers['longitude']], 20)
		end
	end

	def show
		@mesjid = Mesjid.find_by(id: params[:id])
    @kajians = Kajian.by_mesjid(params[:id]).page
    @ustads = Ustad.by_mesjid(params[:id]).page
    if @mesjid.blank?
      render file: '/api/v1/errors/not_available', status: 401
    end
	end
end