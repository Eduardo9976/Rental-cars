require 'rails_helper'

RSpec.describe CarModel, type: :model do
  context 'validation' do 
    it 'should validate presence' do 
      car_model = CarModel.new

      car_model.valid?

      expect(car_model.errors[:name]).to include 'não pode ficar em branco'
      expect(car_model.errors[:fuel_type]).to include 'não pode ficar em branco'
      expect(car_model.errors[:motorization]).to include 'não pode ficar em branco'
      expect(car_model.errors[:year]).to include 'não pode ficar em branco'
    end
    it 'should validate year' do
      category = CarCategory.create!(name: 'A', daily_rate: 10, insurance: 10,
                                     third_insurance: 10)
      manufacturer = Manufacturer.create!(name: 'Honda')
      car_model = CarModel.create!(name: 'Civic', fuel_type: 'flex', motorization: '1.6',
                       year: '2018', manufacturer: manufacturer,
                       car_category: category )
                        
      car_model.valid?
      validate = true

      car_model.year = '2022'
      if car_model.year > Date.today.year
        validate = false
      end
      expect(validate == false) 
    end
  end    
end
