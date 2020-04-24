require 'rails_helper'

feature 'Admin view car models' do
  scenario 'succefully' do
    #arrange
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    fiat = Manufacturer.create!(name: 'Fiat')
    honda = Manufacturer.create!(name: 'Honda')
    cat_a = CarCategory.create!(name: 'A', daily_rate: '50', insurance: '20', third_insurance: '20')
    cat_d = CarCategory.create!(name: 'D', daily_rate: '150', insurance: '60', third_insurance: '60')


    CarModel.create!(name:'Mobi', manufacturer: fiat, car_category: cat_a, fuel_type: 'flex', motorization:'2.0', year: '2018')
    CarModel.create!(name:'Civic', manufacturer:honda, car_category: cat_d, fuel_type: 'flex', motorization:'2.0', year: '2018')

    #act
    login_as user, scope: :user
    visit root_path
    click_on 'Modelos de Carros'

    #assert
    expect(page).to have_content('Fiat')
    expect(page).to have_content('Mobi')
    expect(page).to have_content('A')

    expect(page).to have_content('Honda')
    expect(page).to have_content('Civic')
    expect(page).to have_content('D')
  end
end