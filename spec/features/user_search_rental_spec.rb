require 'rails_helper'

feature 'User search rental' do
  scenario 'Successfully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)
    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')
    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)
    another_rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
      customer: customer, car_category: car_category)              

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    fill_in 'Busca', with: rental.code  
    click_on 'Pesquisar'

    expect(page).to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)
  end
end