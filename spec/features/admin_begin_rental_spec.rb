require 'rails_helper'

feature 'Admin begin rental' do
  scenario 'from customer search' do
    user = create(:user)

    car_category = create(:car_category, name: 'A')
    another_car_category = create(:car_category)

    customer = create(:customer, name: 'Fulano Sicrano', cpf:'372.427.458-02',
                      email: 'teste@teste.com.br')
    rental = create(:rental, start_date: '16/04/2030', end_date: '18/04/2030',
                    customer: customer, car_category: car_category)


    login_as(user)
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: '372.427.458-02'
    click_on 'Pesquisar'
    click_on 'Fulano Sicrano'
    
    
    expect(current_path).to eq customer_path(customer.id)
    expect(page).to have_content rental.code
    expect(page).to have_content 'Categoria A'
    expect(page).to have_link('Iniciar Locação', href: start_rental_path(rental.id))
  end
  scenario 'and view available cars' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)
    another_car_category = CarCategory.create!(name:'B', daily_rate: 200, insurance:200, 
      third_insurance: 200) 

    fiat = Manufacturer.create!(name: 'Fiat')

    car_model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: car_category, fuel_type: 'flex', motorization: '2.0', year: '2020')
    another_car_model = CarModel.create!(name:'Argos', manufacturer: fiat, car_category: another_car_category, fuel_type: 'flex', motorization: '2.0', year: '2020')

    car = Car.create!(license_plate: 'ABC-1234', mileage: 1000, color: 'Azul', car_model: car_model) 
    another_car = Car.create!(license_plate: 'XYZ-9876', mileage: 0, color: 'Preto', car_model: another_car_model) 

    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)

    login_as(user, scope: :user)
    visit customer_path(customer.id)
    click_on 'Iniciar Locação'

    # Assert
    expect(current_path).to eq start_rental_path(rental.id)
    expect(page).to have_content rental.code
    expect(page).to have_content 'Categoria A'
    expect(page).to have_content 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul'
    expect(page).not_to have_content 'Fiat Argos - Placa: XYZ-9876 - Cor: Preto'   
  end
  scenario 'Successfully' do
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

  
    travel_to Time.zone.local(2020, 05, 01, 13, 00, 00) do
      click_on 'Confirmar'
    end
      

    rental.reload
    car.reload
    expect(current_path).to eq rental_path(rental.id)
    expect(rental.ongoing?).to be true
    expect(car.rented?).to be true
    expect(page).to have_content 'Iniciada'
    expect(page).to have_content 'Fulano Sicrano'
    expect(page).to have_content 'Horário da retirada'
    expect(page).to have_content 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul'
    expect(page).to have_content 'Usuário responsável teste@teste.com.br'
    expect(page).to have_content 'Horário da retirada 01/05/2020 13:00:00'
  end  
end