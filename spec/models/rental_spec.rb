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
  end
end
