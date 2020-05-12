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
    @car_rental.amount = count_amount
    
   
  end  

  private

  def car_rentals_params
    params.require(:car_rental).permit(:car_id, :rental_id, add_on_ids: [])
  end  

  def set_car_rental
    @car_rental = CarRental.find(params[:id])
  end


  def count_days
    start = @car_rental.start_date
    devolution = Time.current
    days = devolution.day - start.day
  end
  
  def amount_daily_rate
    days = count_days  
    daily_rate = @car_rental.daily_rate
    count = days * daily_rate
    value = count.to_f > daily_rate.to_f ? count : daily_rate.to_f  
  end

  def amount_insurance
    days = count_days
    insurance = @car_rental.insurance
    count = days * insurance
    value = count.to_f > insurance.to_f ? count : insurance.to_f   
  end

  def amount_third_insurance
    days = count_days 
    third_insurance = @car_rental.third_insurance
    count = days * third_insurance
    value = count.to_f > third_insurance.to_f ? count : third_insurance.to_f
  end  


  def count_amount
    amount_daily_rate.to_f + amount_insurance.to_f + amount_third_insurance.to_f
  end  
end    