class Backend::ProvincesController < Backend::ApplicationController
  before_action :prepare_province, only: [:show, :edit, :update, :destroy]
  before_action :prepare_select, only: [:new, :create, :edit, :update]

  def index
    @provinces = Province.page(params[:page]).per(params[:per])
  end

  def new
    @province = Province.new
  end

  def create
    @province = Province.new(params_province)
    if @province.save
      flash[:success] = 'Province successfully created.'
      redirect_to backend_provinces_path(@province)
    else
      flash[:error] = @province.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @province.update(params_province)
      flash[:success] = 'Province successfully updated.'
      redirect_to backend_provinces_path(@province)
    else
      flash[:error] = @province.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @province.destroy
      flash[:success] = 'Province successfully deleted.'
    else
      flash[:error] = @province.errors.full_messages
    end

    redirect_to backend_provinces_path
  end

  private

    def prepare_province
      @province = Province.find params[:id]
    end

    def prepare_select
      @users = User.pluck(:full_name, :id)
    end

    def params_province
      params.require(:province).permit(:name)
    end

end
