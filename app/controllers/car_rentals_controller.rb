class CarRentalsController < ApplicationController
  before_action :set_car_rental, only: %i[end]
  before_action :authenticate_user!

  def create 
    @car_rental = CarRental.new(car_rentals_params)
    @rental = @car_rental.rental

    @car_rental.user = current_user
    @car_rental.start_date = Time.zone.now

   
    @rental.ongoing!
    @car_rental.car.rented!
    @car_rental.daily_rate = @rental.car_category.daily_rate
    @car_rental.insurance = @rental.car_category.insurance
    @car_rental.third_insurance = @rental.car_category.third_insurance
    @car_rental.save!

    redirect_to @rental
  end

  def end
    @car_rental = set_car_rental
    @car_rental.rental.closed!
    @car_rental.car.available!
    @car_rental.end_date = Time.zone.now
    @car_rental.amount = count
    
   
  end  

  private

  def car_rentals_params
    params.require(:car_rental).permit(:car_id, :rental_id, add_on_ids: [])
  end  

  def set_car_rental
    @car_rental = CarRental.find(params[:id])
  end

  def count 
    start = @car_rental.start_date
    devolution = Time.current
    daily_rate = @car_rental.daily_rate
    #insurance = @car_rental.insurance
    #third_insurance = @car_rental.third_insurance

    
    days = devolution.day - start.day

  
    daily_value = days * daily_rate
    #insurance_value  = days * insurance
    #third_insurance_value = days * third_insurance

  end  
end    