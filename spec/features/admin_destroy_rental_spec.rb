require 'rails_helper'

feature 'Admin destroy rental' do
  scenario 'Succefully'do
  user = User.create!(email: 'teste@teste.com.br', password: '12345678')
  car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                     third_insurance: 100)
  customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                              email: 'teste@teste.com.br')
  
  login_as user, scope: :user                              
  visit root_path
  click_on 'Locações'
  click_on 'Registar locação'

  fill_in 'Data inicial', with: '16/04/2030'
  fill_in 'Data final', with: '18/04/2030'
  select car_category.name, from: 'Categoria'
  select customer.name, from: 'Cliente'
  click_on 'Enviar'

  click_on "Apagar"

  end
end