class Api::V1::UstadsController < ApplicationController
  before_action :get_user, only: [:create, :update]

  def index
    @ustads = Ustad.page
  end

  def create
    @ustad = Ustad.new(ustadz_params)
    @ustad.user_id = current_user
    if @ustad.save
      render json: {status: 201, messages: "Ustadz successfully created"}
    else
      render json: {error:{ messages: @ustad.errors.full_messages.join(', '), status: 422 }}
    end
  end

  def update
    @ustad = Ustad.find(id: params[:id])
    if @ustad.blank?
      render file: '/api/v1/errors/not_available', status: 401
    else
      if @ustad.update(ustadz_params)
        @ustad.contributor_updates.create(user_id: current_user.id)
        render json: {status: 201, messages: "Ustadz successfully updated."}
      else
        render json: {error:{ messages: @ustad.errors.full_messages.join(', '), status: 422}}
      end
    end
  end

  def show
    @ustad = Ustad.find_by(id: params[:id])
    if @ustad.blank?
      render file: '/api/v1/errors/not_available', status: 401
    end
  end

  private
    def ustadz_params
      params.require(:ustad).permit(:name, :description, :notes, :bidang, :pekerjaan, :user_id, :mesjid_id)
    end
end
