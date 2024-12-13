class DeliveriesController < ApplicationController
  before_action :set_recycler, only: [:new, :create]

  def index
    @deliveries = Delivery.joins(:material).select("materials.name as material_name, deliveries.*").page(params[:page]).per(10)
  end

  def new
    @delivery = Delivery.new
    @materials = @recycler.materials
  end

  def create
    @delivery = Delivery.new(delivery_params)
    if @delivery.save
      redirect_to deliveries_path, notice: "Entrega registrada exitosamente."
    else
      render :new
    end
  end

  private

  def set_recycler
    @recycler = Recycler.find(params[:recycler_id])
  end

  def delivery_params
    params.require(:delivery).permit(:material_id, :date, :quantity)
  end
end
