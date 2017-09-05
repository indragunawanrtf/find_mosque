class Backend::UstadsController < Backend::ApplicationController
  before_action :prepare_ustad, only: [:show, :edit, :update, :destroy]
  before_action :prepare_select, only: [:new, :create, :edit, :update]

  def index
    @ustads = Ustad.page(params[:page]).per(params[:per])
  end

  def new
    @ustad = Ustad.new
  end

  def create
    @ustad = Ustad.new(params_ustad)
    if @ustad.save
      flash[:notice] = 'Ustadz successfully created.'
      redirect_to backend_ustads_path(@ustad)
    else
      flash[:alert] = @ustad.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ustad.update(params_ustad)
      flash[:notice] = 'Ustadz successfully updated.'
      redirect_to backend_ustads_path(@ustad)
    else
      flash[:alert] = @ustad.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @ustad.destroy
      flash[:success] = 'Ustad successfully deleted.'
    else
      flash[:error] = @ustad.errors.full_messages
    end

    redirect_to backend_ustads_path
  end

  private

    def prepare_ustad
      @ustad = Ustad.find params[:id]
    end

    def prepare_select
      @users = User.pluck(:full_name, :id)
    end

    def params_ustad
      params.require(:ustad).permit(:name, :description, :notes, :bidang, :pekerjaan)
    end

end
