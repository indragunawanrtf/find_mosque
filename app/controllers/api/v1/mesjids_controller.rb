class Api::V1::MesjidsController < Api::ApplicationController
	before_action :get_user, only: [:create, :update]

	def index
		if params[:all].present? || (request.headers['latitude'].blank? && request.headers['longitude'].blank?)
			@mesjids = Mesjid.page
		else
			@mesjids = Mesjid.near([request.headers['latitude'], request.headers['longitude']], 20)
		end
	end

	def create
    @mesjid = Mesjid.new params_mesjid
    @mesjid.user_id = current_user.id
    if @mesjid.save
			render json: {status: 201, messages: "Mesjid successfully created."}
    else
      render json: {error:{ messages: @mesjid.errors.full_messages.join(', '), status: 422 }}
    end
	end

	def update
    @mesjid = Mesjid.find_by params[:id]
    if @mesjid.blank?
      render file: '/api/v1/errors/not_available', status: 401
    else
		  if @mesjid.update(params_mesjid)
				render json: {status: 201, messages: "Mesjid successfully Updated."}
		  else
		    render json: {error:{ messages: @mesjid.errors.full_messages.join(', '), status: 422 }}
		  end
		end
	end

	def show
		@mesjid = Mesjid.find_by(id: params[:id])
	  @kajians = Kajian.by_mesjid(params[:id]).page
	  @ustads = Ustad.by_mesjid(params[:id]).page
	  @assets = @mesjid.assets
    if @mesjid.blank?
      render file: '/api/v1/errors/not_available', status: 401
    end
	end

	private
		def params_mesjid
	    params.require(:mesjid).permit(:name, :description, :kota, :kecamatan, :address, :latitude, :longitude,
	    															 :tahun_berdiri, :jenis, :status_tanah, :province_id, :province_name,
	    															 :open_time, :close_time, :notes, :user_id)
		end
end