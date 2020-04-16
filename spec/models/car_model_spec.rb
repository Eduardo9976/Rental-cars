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
    it 'should validate year ' do
      category = CarCategory.create!(name: 'A', daily_rate: 10, insurance: 10,
        third_insurance: 10)
      manufacturer = Manufacturer.create!(name: 'Honda')
      CarModel.create!(name: 'Civic', fuel_type: 'flex', motorization: '1.6',
        year: 2025, manufacturer: manufacturer, car_category: category )
  
      car_model.valid?

      expect(page).to have_content('Ano de fabricação incorreto')
    end
  end    
end
