require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'Mileage validation' do
    it 'Should validade mileage >= 0' do
      car = Car.new(mileage: -5)
      
      car.valid?
      
      expect(car.errors[:mileage]).to include 'não pode ser menor que zero'
    end
    it 'Should car errors to be empty'do 
      car = Car.new(mileage: 10)
      
      car.valid?

      expect(car.errors[:mileage]).to be_empty
    end
    it 'Should car have mileage valid' do
      car = Car.new(mileage: 0)

      car.valid?

      expect(car.errors[:mileage]).not_to include 'não pode ser menor que zero'
    end  
  end
end
