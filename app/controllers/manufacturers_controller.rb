class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end
  def show
    @manufacturer = Manufacturer.find(params[:name])
  end  

  def new
    @manufacturer = Manufacturer.new
  end
  
  def create
    name = param[:manufacturer] [:name]
    @manufacturer = Manufacturer.new
    @manufacturer.name = name
    if @manufacturer.save
      redirect_to @manufacturer
    else
      render :new
    end    
  end   
end  