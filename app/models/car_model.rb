
class CarModel < ApplicationRecord
  has_many :cars
  belongs_to :manufacturer
  belongs_to :car_category
  validates :name, :fuel_type, :motorization, :year,  presence: true
  validate :year_validation
  def year_validation
    if year.to_i > Date.today.year.to_i
      errors.add(:year, "incorreto")
    end    
  end
end
