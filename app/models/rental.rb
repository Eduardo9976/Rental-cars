class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  has_one :car_rental
  
  validates :start_date, :end_date, :car_category, :customer, presence:true
  validates :code, uniqueness: true
  validate :valid_end_date
  validate :valid_start_date
  enum status: {scheduled: 0, ongoing: 10 }
  
  before_create :generate_code

  
  
  def set_scheduled
    self.status = 'scheduled'
  end
  
  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end  
  
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
  
  private

end
