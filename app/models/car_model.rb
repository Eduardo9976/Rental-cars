class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :car_category
  validates :name, :fuel_type, :motorization, :year,  presence: true
  validate :year_validation
  def year_validation
    if year > Date.today.year
      errors.add(:year, "Ano de fabricação incorreto")
    end    
  end
end
