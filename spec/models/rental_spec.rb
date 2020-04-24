require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'date validation' do
    it 'should validate start date > today' do
      rental = Rental.new(start_date: 2.day.ago)
      
      rental.valid?

      expect(rental.errors[:start_date]).to include 'deve ser maior que hoje'
    end
    it 'should validate start date is valid' do
      rental = Rental.new(start_date: Date.today)

      rental.valid?

      expect(rental.errors[:start_date]).not_to include 'deve ser maior que hoje'
    end
    it 'should rental errors to be empty' do
      rental = Rental.new(start_date: Date.today)

      rental.valid?

      expect(rental.errors[:start_date]).to be_empty
    end
    it 'created automatically' do
      car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                         third_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                  email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030',
                          customer: customer, car_category: car_category)

     rental.save!

     expect(rental.code.size).to eq(6)      
    end  
  end
end
