class Car < ApplicationRecord
  belongs_to :car_model

  validates :license_plate, :color, :mileage, :car_model, presence: true
  validates :license_plate, uniqueness: true
  validate :valid_mileage

  def valid_mileage
    return if mileage.nil?

    if mileage.to_i < 0
      errors.add(:mileage, 'não pode ser menor que zero')
    end
  end    
end
