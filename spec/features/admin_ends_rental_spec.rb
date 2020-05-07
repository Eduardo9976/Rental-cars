require 'rails_helper'

feature 'Admin ends a rental ' do
  scenario 'link to end rental ' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)

    fiat = Manufacturer.create!(name: 'Fiat')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', 
                                motorization: '2.0', year: '2020')

    car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model, status: :available) 

    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')
                                
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)

    login_as user, scope: :user
    visit start_rental_path(rental.id)
    select 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul', from: 'Carro'


    click_on 'Confirmar'



    expect(current_path).to eq rental_path(rental.id)  
    expect(page).to have_content rental.code
    expect(page).to have_content 'Carro retirado Fiat Mobi - Placa: ABC-1234 - Cor: Azul'
    expect(page).to have_content('Encerrar Locação')
  end
  scenario 'ends rental' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:25, 
                                      third_insurance: 13)

    fiat = Manufacturer.create!(name: 'Fiat')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', 
                                motorization: '2.0', year: '2020')

    car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model, status: :available) 

    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')
                                
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)

    login_as user, scope: :user
    visit start_rental_path(rental.id)
    select 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul', from: 'Carro'


    travel_to Time.zone.local(2020, 05, 01, 13, 00, 00) do
      click_on 'Confirmar'
    end
    travel_to Time.zone.local(2020, 05, 03, 12, 30, 00) do
      click_on 'Encerrar Locação'
    end
    
    
    
    rental.reload
    car.reload

    expect(current_path).to eq end_car_rental_path(rental.id)
    expect(rental.ongoing?).to be false
    expect(car.rented?).to be false
    expect(rental.closed?).to be true
    expect(page).to have_content 'Horário da retirada 01/05/2020 13:00:00'
    expect(page).to have_content 'Horário da devolução 03/05/2020 12:30:00'
    expect(page).to have_content('Valor Total R$ 200,00')

  end
end  