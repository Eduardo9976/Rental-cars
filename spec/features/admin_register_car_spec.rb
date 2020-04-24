require 'rails_helper'

feature 'Admin Register Car' do
  scenario 'Succefully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20', third_insurance: '20')
    model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, fuel_type: 'flex', motorization:'2.0', year: '2018')

    carro = Car.create!(license_plate: 'ENS-7677', color:'Black', mileage:10000, car_model:model)

    login_as user, scope: :user
    visit root_path
    click_on 'Carros'

    expect(page).to have_content('Carros')
    expect(page).to have_content('Mobi')
    expect(page).to have_content('ENS-7677')
  end
end
