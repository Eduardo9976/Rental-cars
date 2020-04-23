require 'rails_helper'

feature 'Admin valid cars' do
  scenario 'Succefully' do
    gm = Manufacturer.create!(name: 'GM')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20', third_insurance: '20')
    model = CarModel.create!(name:'Agile', manufacturer:gm, car_category: cat_a, fuel_type: 'flex', motorization:'2.0', year: '2018')
    
    car = Car.create!(license_plate: 'CBO-0001', color: 'Vermelho',mileage: 0, car_model:model)

    visit root_path
    click_on 'Carros'
    click_on 'Registrar novo carro'
    fill_in 'Placa', with: 'CBO-0001'
    fill_in 'Cor', with: 'Azul'
    fill_in 'Quilometragem', with: 10
    select model.name, from: 'Modelo do carro'
    click_on 'Enviar'

  expect(page).to have_content('já está em uso')  
  end
end    