require 'rails_helper'

RSpec.describe RentalMailer, type: :mailer do
  describe '#rental_sheduled ' do 
    it 'Should send the confirmation code' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                         insurance: 100, third_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                                  email: 'teste@teste.com.br')
      rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                              customer: customer, car_category: car_category)


      mail = RentalMailer.rental_scheduled(rental.id)


      expect(mail.body).to include rental.code
      expect(mail.body).to include 'Data da Retirada: 16/04/2030'
    end
    
    it 'shoud send to the customer' do 
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                        insurance: 100, third_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                                  email: 'teste@teste.com.br')
      rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                              customer: customer, car_category: car_category)


      mail = RentalMailer.rental_scheduled(rental.id)


      expect(mail.subject).to eq "Confirmação de Agendamento - #{rental.code}"
      expect(mail.to).to eq ['teste@teste.com.br']
    end
  end    
end  
