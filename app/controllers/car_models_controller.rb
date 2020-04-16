class CarModelsController < ApplicationController
  before_action :set_car_model, only: [:show]
  def index
    @car_models = CarModel.all
  end
  
  def new
    @car_model = CarModel.new
  end
  def create
    @car_model = CarModel.new(params_car_model)
    if @car_model.save
      redirect_to @car_model
    else
      render :new
    end    
  end

  def show
    
  end  
  
  
  private

  def set_car_model
    @car_model = CarModel.find(params[:id])
  end  

  def params_car_model
    params.require(:car_model).permit(:name, :fuel_type, :motorization, :year,
                                                     :manufacturer_id,
                                                     :car_category_id)
  end                                
end