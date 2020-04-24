class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy]
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
      redirect_to @rental
    else
      render :edit
    end
  end
  
  def destroy
    @rental.destroy
    redirect_to rentals_path
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