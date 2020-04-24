class ManufacturersController < ApplicationController
  #before_action :set_manufacturer only[]
  before_action :authenticate_user!
  
  def index
    @manufacturers = Manufacturer.all
  end
  def show
    @manufacturer = set_manufacturer
  end  

  def new
    @manufacturer = Manufacturer.new
  end
  
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    #@manufacturer.name = name
    if @manufacturer.save
      redirect_to @manufacturer
    else
      render :new
    end    
  end
  
  def edit
    #@manufacturer = Manufacturer.find(params[:id])
    set_manufacturer
  end

  def update 
    #@manufacturer = Manufacturer.find(params[:id])
    set_manufacturer
    if @manufacturer.update(manufacturer_params)
      redirect_to @manufacturer
    else
      render :edit
      #Modificar junto com o new para um HTML _form  e mudar no html para render o form
    end    
  end
  
  def destroy
    #@manufacturer = Manufacturer.find(params[:id])
    set_manufacturer
    @manufacturer.destroy

    redirect_to manufacturers_path
  end  
  
  
  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end  
  
  
  def manufacturer_params
    #{ params[:manufacturer] [:name] }
    params.require(:manufacturer).permit(:name) #poderia colocar outros params dentro
  end  
  
end  