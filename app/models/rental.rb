class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  validates :start_date, :end_date, :car_category, :customer, presence:true
  validate :valid_end_date
  validate :valid_start_date
  
  
  def valid_end_date
    return if end_date.nil? || start_date.nil?
     
    if end_date < start_date
      errors.add(:end_date, 'deve ser maior que a data de início')
    end  
  end
  
  def valid_start_date
    return if start_date.nil?

    if start_date < Date.today
      errors.add(:start_date, 'deve ser maior que hoje')
    end    
  end  
end
