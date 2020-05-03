class Car < ApplicationRecord
  belongs_to :car_model
  has_many :car_rentals
  enum status: {available: 0, rented: 10}

  validates :license_plate, :color, :mileage, :car_model, presence: true
  validates :license_plate, uniqueness: true
  validate :valid_mileage
  
  def description
    "#{car_model.manufacturer.name} #{car_model.name} - Placa: #{license_plate} - Cor: #{color}"
  end


  def valid_mileage
    return if mileage.nil?

    if mileage.to_i < 0
      errors.add(:mileage, 'não pode ser menor que zero')
    end
  end    
end

