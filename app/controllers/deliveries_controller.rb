class DeliveriesController < ApplicationController
  before_action :set_recycler, only: [:index, :new, :create, :destroy]
  before_action :set_delivery, only: [:destroy]
  before_action :authenticate_user!

  def index
    @deliveries = @recycler.deliveries.page(params[:page]).per(10)
  end

  def new
    @delivery = @recycler.deliveries.new
    @materials = @recycler.materials
  end

  def create
    @delivery = @recycler.deliveries.new(delivery_params)
    if @delivery.save
      redirect_to recycler_deliveries_path(@recycler), notice: 'Entrega registrada correctamente.'
    else
      render :new
    end
  end

  def destroy
    if @delivery
      @delivery.destroy
      redirect_to recycler_deliveries_path(@recycler), notice: "Entrega eliminada correctamente."
    else
      redirect_to recycler_deliveries_path(@recycler), alert: "No se encontró la entrega."
    end
  end

  private

  def set_recycler
    @recycler = Recycler.find(params[:recycler_id]) # Esto busca el reciclador
  rescue ActiveRecord::RecordNotFound
    redirect_to recyclers_path, alert: "Reciclador no encontrado."
  end

  def set_delivery
    @delivery = @recycler.deliveries.find_by(id: params[:id]) if @recycler # Esto busca la entrega
  rescue ActiveRecord::RecordNotFound
    redirect_to recycler_deliveries_path(@recycler), alert: "Entrega no encontrada."
  end

  def delivery_params
    params.require(:delivery).permit(:material_id, :quantity, :date)
  end
end
