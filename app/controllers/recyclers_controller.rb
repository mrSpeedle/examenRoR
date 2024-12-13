class RecyclersController < ApplicationController
  before_action :set_recycler, only: [:show, :edit, :update, :destroy, :deliveries]

  def index
    @recyclers = Recycler.page(params[:page]).per(10)
  end

  def show; end

  def new
    @recycler = Recycler.new
  end

  def create
    @recycler = Recycler.new(recycler_params)
    if @recycler.save
      redirect_to recyclers_path, notice: "Reciclador creado exitosamente."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recycler.update(recycler_params)
      redirect_to recyclers_path, notice: "Reciclador actualizado exitosamente."
    else
      render :edit
    end
  end

  def destroy
    @recycler.destroy
    redirect_to recyclers_path, notice: "Reciclador eliminado."
  end

  def deliveries
    @deliveries = @recycler.materials.joins(:deliveries).select("materials.*, deliveries.date, deliveries.quantity").page(params[:page]).per(10)
  end

  private

  def set_recycler
    @recycler = Recycler.find(params[:id])
  end

  def recycler_params
    params.require(:recycler).permit(:name, :phone, :address, :email)
  end
end
