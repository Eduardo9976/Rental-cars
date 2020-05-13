class CarRentalsController < ApplicationController
  before_action :set_car_rental, only: %i[end]
  before_action :authenticate_user!

  def create 
    @car_rental = current_user.car_rentals.new(car_rentals_params)
  
    @car_rental.start_date = Time.zone.now
    
    @rental.ongoing!
    @car_rental.car.rented!
    @car_rental.daily_rate = @rental.car_category.daily_rate
    @car_rental.insurance = @rental.car_category.insurance
    @car_rental.third_insurance = @rental.car_category.third_insurance
    @car_rental.save!

    redirect_to @car_rental.rental
  end

  def end
    @car_rental.finalize!
  end  

  private

  def car_rentals_params
    params.require(:car_rental).permit(:car_id, :rental_id, add_on_ids: [])
  end  

  def set_car_rental
    @car_rental = CarRental.find(params[:id])
  end

end    