class CarsController < ApplicationController
  before_action :set_cars, only: %i[show edit update destroy]
  before_action :authenticate_user!
  
  def index
    @cars = Car.all
  end
  
  def new
    @car = Car.new
  end
  def create
    @car = Car.new(params_cars)
    if @car.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @car
    else 
      render :new
    end       
  end

  def show
    
  end 
  
  def edit

  end
  def update
    if @car.update(params_cars)
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @car
    else
      render :edit
    end    
  end
  
  
  def destroy
    @car.destroy
    redirect_to cars_path
  end 
  
  def search 
    @cars = Car.where(license_plate: params[:q])
    render :index
  end  
  

  private

  def set_cars
    @car = Car.find(params[:id])
  end
  
  def params_cars
    params.require(:car).permit(:license_plate, :color, 
                                :mileage, :car_model_id) 
  end
end  