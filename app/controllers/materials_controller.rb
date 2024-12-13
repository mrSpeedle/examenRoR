class MaterialsController < ApplicationController
  before_action :set_recycler

  def index
    @materials = @recycler.materials.page(params[:page]).per(10)
  end

  def new
    @material = @recycler.materials.new
  end

  def create
    @material = @recycler.materials.new(material_params)
    if @material.save
      redirect_to recycler_materials_path(@recycler), notice: "Material creado exitosamente."
    else
      render :new
    end
  end

  private

  def set_recycler
    @recycler = Recycler.find(params[:recycler_id])
  end

  def material_params
    params.require(:material).permit(:name, :description)
  end
end
