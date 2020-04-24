require 'rails_helper'

feature 'User search car' do
  scenario 'Successfully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20', third_insurance: '20')
    model = CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, fuel_type: 'flex', motorization:'2.0', year: '2018')

    car = Car.create!(license_plate: 'ENS-7677', color:'Black', mileage:10000, car_model:model)
    other_car = Car.create!(license_plate: 'EJP-1767', color:'Black', mileage:10000, car_model:model)


    login_as user, scopo: :User
    visit root_path
    click_on 'Carros'
    fill_in 'Busca', with: car.license_plate
    click_on 'Pesquisar'

    expect(page).to have_content(car.license_plate)
    expect(page).not_to have_content(other_car.license_plate)
  end
end