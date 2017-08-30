class Backend::MesjidsController < Backend::ApplicationController
  before_action :prepare_mesjid, only: [:show, :edit, :update, :destroy]
  before_action :prepare_select, only: [:new, :create, :edit, :update]

  def index
    @mesjids = Mesjid.page(params[:page]).per(params[:per])
  end

  def new
    @mesjid = Mesjid.new
  end

  def create
    @mesjid = Mesjid.new params_mesjid
    if @mesjid.save
      flash[:success] = 'Mesjid successfully created.'
      redirect_to backend_mesjid_path(@mesjid)
    else
      flash[:error] = @mesjid.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mesjid.update params_mesjid
      flash[:success] = 'Mesjid successfully updated.'
      redirect_to backend_mesjid_path(@mesjid)
    else
      flash[:error] = @mesjid.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @mesjid.destroy
      flash[:success] = 'Mesjid successfully deleted.'
    else
      flash[:error] = @mesjid.errors.full_messages
    end

    redirect_to backend_mesjids_path
  end

  private

    def prepare_mesjid
      @mesjid = Mesjid.find params[:id]
    end

    def prepare_select
      @users = User.pluck(:full_name, :id)
    end

    def params_mesjid
      params.require(:mesjid).permit(:name, :description, :kota, :kecamatan, :address, :latitude, :longitude,
                                     :tahun_berdiri, :jenis, :status_tanah, :province_id, :open_time, :close_time,
                                     :notes, :user_id)
    end

end
