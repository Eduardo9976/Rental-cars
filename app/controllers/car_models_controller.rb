class CarModelsController < ApplicationController
  before_action :set_car_model, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
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
  

  def edit

  end
  def update
    if @car_model.update(params_car_model)
      redirect_to @car_model
    else
      render :edit
    end    
  end
  
  def destroy
    @car_model.destroy
    redirect_to car_models_path
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