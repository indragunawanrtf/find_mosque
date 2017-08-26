class Api::V1::MesjidsController < Api::ApplicationController

	def index
		@mesjids = Mesjid.page
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