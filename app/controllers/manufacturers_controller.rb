class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end
  def show
    @manufacturer = Manufacturer.find(params[:name])
  end  
end  