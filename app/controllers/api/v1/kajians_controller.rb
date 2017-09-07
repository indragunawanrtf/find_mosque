class Api::V1::KajiansController < Api::ApplicationController
	before_action :get_user, only: [:create, :update]

	def index
		@kajians = Kajian.page
	end

	def create
    @kajian = Kajian.new params_kajian
    @kajian.user_id = current_user.id
    if @kajian.save
			render json: {status: 201, messages: "Kajian successfully created."}
    else
      render json: {error:{ messages: @kajian.errors.full_messages.join(', '), status: 422 }}
    end
	end

	def update
    @kajian = Kajian.find_by id: params[:id]
    if @kajian.blank?
      render file: '/api/v1/errors/not_available', status: 401
    else
		  if @kajian.update(params_kajian)
        @kajian.contributor_updates.create(user_id: current_user.id)
				render json: {status: 201, messages: "Kajian successfully Updated."}
		  else
		    render json: {error:{ messages: @kajian.errors.full_messages.join(', '), status: 422 }}
		  end
		end
	end

	def show
		@kajian = Kajian.find_by(id: params[:id])
    if @kajian.blank?
      render file: '/api/v1/errors/not_available', status: 401
    end
	end

	private
		def params_kajian
	    params.require(:kajian).permit(:name, :description, :mesjid_id, :ustad_id, :start_at, :end_at, :user_id)
		end
end