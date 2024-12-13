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

    # Mostrar el formulario para registrar una entrega
    def new_delivery
      @delivery = @recycler.deliveries.build
      @materials = @recycler.materials
    end
  
    # Guardar la nueva entrega
    def create_delivery
      @delivery = @recycler.deliveries.build(delivery_params)
      if @delivery.save
        redirect_to deliveries_recycler_path(@recycler), notice: 'Entrega registrada exitosamente.'
      else
        @materials = @recycler.materials
        render :new_delivery
      end
    end
  
    def materials
      @materials = @recycler.materials.page(params[:page]).per(10)
    end

    def new_material
      @material = @recycler.materials.build
    end

    def create_material
      @material = @recycler.materials.build(material_params)
      if @material.save
        redirect_to materials_recycler_path(@recycler), notice: 'Material reciclado creado exitosamente.'
      else
        render :new_material
      end
    end

  private

  def set_recycler
    @recycler = Recycler.find(params[:id])
  end

  def recycler_params
    params.require(:recycler).permit(:name, :phone, :address, :email)
  end

  def delivery_params
    params.require(:delivery).permit(:material_id, :date, :quantity)
  end

  def material_params
    params.require(:material).permit(:name, :description)
  end

end
