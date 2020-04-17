require 'rails_helper'

feature 'Admin edit rental' do
  scenario 'Succefully'do
  car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                     third_insurance: 100)
  customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-2',
                              email: 'teste@teste.com.br')
    
  visit root_path
  click_on 'Locações'
  click_on 'Registar locação'

  fill_in 'Data inicial', with: '16/04/2030'
  fill_in 'Data final', with: '18/04/2030'
  select car_category.name, from: 'Categoria'
  select customer.name, from: 'Cliente'
  click_on 'Enviar'

  click_on "Editar"

  expect(page).to have_content(/A/)
  expect(page).to have_content('Fulano Sicrano')
  end
end