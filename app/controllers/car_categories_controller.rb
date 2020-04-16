class CarCategoriesController < ApplicationController
  before_action :set_car_category, only: [:show, :edit, :update, :destroy]
  def index
    @car_categories = CarCategory.all
  end
  
  def new
    @car_category = CarCategory.new
  end 
  
  
  def create 
    @car_category = CarCategory.new(params_car_category)
    if @car_category.save
      redirect_to @car_category
    else
      render :new
    end     
  end
  
  def show
     
  end

  def edit
    
  end
  def update
    if @car_category.update(params_car_category)
      redirect_to @car_category
    else
      render :edit
    end  
  end
  
  def destroy  
    @car_category.destroy
    redirect_to car_categories_path
  end  


  private

  def params_car_category
    params.require(:car_category).permit(:name, :daily_rate, :insurance, :third_insurance)
  end
  
  def set_car_category
    @car_category = CarCategory.find(params[:id])
  end    
end  