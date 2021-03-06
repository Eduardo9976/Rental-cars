require 'rails_helper'

feature 'Admin register rental' do 
  scenario 'sucessffuly' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
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
    #expect(RentalMailer).to receive(:rental_scheduled).and_call_original 
    click_on 'Enviar'

    
    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content(/A/)
    expect(page).to have_content('Fulano Sicrano')
  end

  scenario 'validate wrong period' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
      third_insurance: 100)
    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
    email: 'teste@teste.com.br')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registar locação'

    fill_in 'Data inicial', with: '15/04/2030'
    fill_in 'Data final', with: '01/04/2030'
    select car_category.name, from: 'Categoria'
    select customer.name, from: 'Cliente'
    click_on 'Enviar'
    
    expect(page).to have_content('Data final deve ser maior que a data de início')
  end  
end  