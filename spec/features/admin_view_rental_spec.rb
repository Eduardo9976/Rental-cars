require 'rails_helper'

feature 'Admin view rentals' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')
    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)
    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-02',
                                email: 'teste@teste.com.br')
    Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)
    
    login_as user, scope: :user              
    visit root_path
    click_on 'Locações'
    
    expect(page).to have_content('2030-04-16')
    expect(page).to have_content('2030-04-18')
    expect(page).to have_content('Fulano Sicrano')
    expect(page).to have_content(/A/)
  end
end