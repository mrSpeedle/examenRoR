class MaterialsController < ApplicationController
  before_action :set_recycler
  before_action :set_material, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @materials = @recycler.materials.page(params[:page]).per(10)
  end

  def show
    # El material ya está cargado por el before_action set_material
  end

  def new
    @material = @recycler.materials.new
    @base_materials = BaseMaterial.all  # Cargar todos los BaseMaterials para mostrarlos en el select
  end

  def create
    @material = @recycler.materials.new(material_params)
    if @material.save
      redirect_to recycler_materials_path(@recycler), notice: "Material creado exitosamente."
    else
      render :new
    end
  end

  def destroy
    @material = @recycler.materials.find(params[:id])  # Asegúrate de cargar el material correctamente
    Rails.logger.debug("Intentando eliminar el material: #{@material.inspect}")  # Depuración
    if @material.destroy
      Rails.logger.debug("Material eliminado correctamente")  # Depuración
      redirect_to recycler_materials_path(@recycler), notice: "Material eliminado correctamente."
    else
      Rails.logger.debug("No se pudo eliminar el material")  # Depuración
      redirect_to recycler_materials_path(@recycler), alert: "No se pudo eliminar el material."
    end
  end
  
  
  

  private

  def set_recycler
    @recycler = Recycler.find(params[:recycler_id])
  end

  def set_material
    @material = @recycler.materials.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :description, :base_material_id)  # Permitir el base_material_id
  end
end
