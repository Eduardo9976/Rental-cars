require 'rails_helper'

feature 'Admin begin rental' do
  xscenario 'from customer search'
  user = User.create!
  customer = Customer.create!
  car_category = CarCategory
  manufacturer = Manufacturer.create
  car_model = CarModel.create 
  car = Car.create(status: :avaliable)
  rental = Rental.create


  fineshed_rental = Rental.create(status: :fineshed)
  login_as user, scope: :user
  visit root_path
  click_on 'Clientes'
  fill_in 'Busca', with: '1902831290'
  click_on 'Pesquisar'
  click_on 'João Almeida'
  click_on 'Iniciar Locação'
  select 'Ford Ka - ABC1234', from: 'Escolha um carro:'
  click_on 'Confirmar'

end