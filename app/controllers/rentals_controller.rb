class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update  ]
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
    #var para o collection
    @car_categories = CarCategory.all
    @customers = Customer.all
  end
  def create
    @rental = Rental.new(params_rental)
    if @rental.save
      redirect_to @rental
    else 
      render :new
    end
  end


  def show
    
  end
  

  def edit

  end
  
  def update 
    if @rental.update(params_rental)
      redirect_to @rental
    else
      render :edit
    end
  end    

  

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end
  
  def params_rental
    params.require(:rental) .permit(:start_date, :end_date,
                                    :car_category_id, :customer_id)
  end  
end  