class Backend::KajiansController < Backend::ApplicationController
  before_action :prepare_kajian, only: [:show, :edit, :update, :destroy]
  before_action :prepare_select, only: [:new, :create, :edit, :update]

  def index
    @kajians = Kajian.page(params[:page]).per(params[:per])
  end

  def new
    @kajian = Kajian.new
  end

  def create
    @kajian = Kajian.new(params_kajian)
    if @kajian.save
      flash[:notice] = 'Kajian successfully created.'
      redirect_to backend_kajians_path(@kajian)
    else
      flash[:alert] = @kajian.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kajian.update(params_kajian)
      flash[:notice] = 'Ustadz successfully updated.'
      redirect_to backend_kajians_path(@kajian)
    else
      flash[:alert] = @kajian.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @kajian.destroy
      flash[:success] = 'Ustad successfully deleted.'
    else
      flash[:error] = @kajian.errors.full_messages
    end

    redirect_to backend_kajians_path
  end

  private

    def prepare_kajian
      @kajian = Kajian.find params[:id]
    end

    def prepare_select
      @users = User.pluck(:full_name, :id)
    end

    def params_kajian
      params.require(:kajian).permit(:name, :description, :mesjid_id, :ustad_id, :start_at, :end_at, :user_id)
    end

end
