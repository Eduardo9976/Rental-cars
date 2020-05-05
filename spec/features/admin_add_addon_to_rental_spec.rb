require 'rails_helper'
feature 'Admin add addon to rental' do
  scenario 'View addons' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)

    fiat = Manufacturer.create!(name: 'Fiat')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', 
                                motorization: '2.0', year: '2020')

    car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model, status: :available) 

    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')

    addon = AddOn.create!(name: 'Carrinho de Bebe', daily_rate: 59, serial_number: 'BEBE1234')
    other_addon = AddOn.create!(name: 'Transporte para Bike', daily_rate: 29, serial_number: 'BIKE999')  
    unused_addon = AddOn.create!(name: 'Carregador para celular', daily_rate: 29, serial_number: 'XCV12999')                           
                                
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)

    login_as user, scope: :user
    visit start_rental_path(rental.id)
    

    expect(page).to have_content('Carrinho de Bebe')
    expect(page).to have_content('Transporte para Bike')
  end
  scenario 'and choose addons' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)

    fiat = Manufacturer.create!(name: 'Fiat')
    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', 
                                motorization: '2.0', year: '2020')

    car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model, status: :available) 

    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')

    addon = AddOn.create!(name: 'Carrinho de Bebe', daily_rate: 59, serial_number: 'BEBE1234')
    other_addon = AddOn.create!(name: 'Transporte para Bike', daily_rate: 29, serial_number: 'BIKE999')  
    unused_addon = AddOn.create!(name: 'Carregador para celular', daily_rate: 9, serial_number: 'XCV12999')                           
                                
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)

    login_as user, scope: :user
    visit start_rental_path(rental.id)
    select 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul', from: 'Carro'
    check 'Carrinho de Bebe'
    check 'Transporte para Bike'
    click_on 'Confirmar'


    expect(current_path).to eq rental_path(rental.id)
    expect(page).to have_content('status Iniciada')
    expect(page).to have_content('Carrinho de Bebe')
    expect(page).to have_content('Transporte para Bike')
    expect(page).to have_content('Valor da Diária R$ 100,00')  
    expect(page).not_to have_content('Carregador para celular')
  end  
end