class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end
  def show
    @manufacturer = Manufacturer.find(params[:id])
  end  

  def new
    @manufacturer = Manufacturer.new
  end
  
  def create
    name = params[:manufacturer] [:name]
    @manufacturer = Manufacturer.new
    @manufacturer.name = name
    if @manufacturer.save
      redirect_to @manufacturer
    else
      render :new
    end    
  end
  
  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update 
    @manufacturer = Manufacturer.find(params[:id])
    name = params[:manufacturer] [:name]
    if @manufacturer.update(name: name)
      redirect_to @manufacturer
    else
      render :new
    end    
  end
  
  def destroy
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.destroy

    redirect_to manufacturers_path
  end  
  
  
end  