class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy confirm]
  before_action :bd_all
  before_action :authenticate_user!
  
  def index
    @rentals = Rental.all
  end

  def new
    bd_all
    @rental = Rental.new
  end
  def create
    @rental = Rental.new(params_rental)
    if @rental.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @rental
    else
      render :new
    end
  end


  def show
    
  end
  

  def edit
    bd_all
  end
  
  def update 
    if @rental.update(params_rental)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @rental
    else
      render :edit
    end
  end
  
  def destroy
    @rental.destroy
    redirect_to rentals_path
  end  

  def search
    @rentals = Rental.where(code: params[:q])
    render :index
  end
  
  def start
    @rental = set_rental
    car_models = @rental.car_category.car_models
    @available_cars = Car.where(car_model:  car_models)
  end
  def confirm 
    @rental = set_rental
    @car = Car.find(params[:car_id])
    @user = current_user

    begin
    ActiveRecord::Base.transaction do
      @rental.ongoing!
      @car.rented!
      
      CarRental.create!(rental:@rental, car:@car, start_date: Time.zone.now, user:current_user,
                      daily_rate:@rental.car_category.daily_rate, insurance:@rental.car_category.insurance,
                      third_insurance: @rental.car_category.third_insurance )

                           
      end
    logger.error"#{@rental.code}- não foi possível iniciar a locação"                    
    end
    redirect_to @rental
  end   
  

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end
  
  def params_rental
    params.require(:rental).permit(:start_date, :end_date,
                                    :car_category_id, :customer_id)
  end
   
  def bd_all
   #var para o collection
   @car_categories = CarCategory.all
   @customers = Customer.all
  end
end  