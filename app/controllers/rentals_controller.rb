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
      RentalMailer.rental_scheduled(@rental.id).deliver_later
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
    @add_ons = AddOn.all
    @car_rental = CarRental.new(rental: @rental)
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