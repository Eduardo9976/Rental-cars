class CarRental < ApplicationRecord
  belongs_to :rental
  belongs_to :car
  belongs_to :user
  has_many :add_on_car_rentals
  has_many :add_ons, through: :add_on_car_rentals

  def finalize!
    rental.closed!
    car.available!
    self.end_date = Time.zone.now
    self.amount = count_amount
    save
  end  

  private
  
  def count_days
    days = (( end_date - start_date ) / 1.day).ceil
    days.zero? ? 1 : days 
  end
  
  def amount_daily_rate
    count_days * daily_rate
  end

  def amount_insurance
    count_days * insurance     
  end

  def amount_third_insurance
    count_days * third_insurance
  end  


  def count_amount
    amount_daily_rate + amount_insurance + amount_third_insurance
  end  
end

