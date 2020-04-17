require 'rails_helper'

feature 'Admin view rentals' do
  scenario 'succefully' do
    car_category = CarCategory.create!(name:'A', daily_rate: 100, insurance:100, 
                                      third_insurance: 100)
    customer = Customer.create!(name: 'Fulano Sicrano', cpf:'372.427.458-2',
                                email: 'teste@teste.com.br')
    Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                  customer: customer, car_category: car_category)
                  
    visit root_path
    click_on 'Locações'
    
    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content('Fulano Sicrano')
    expect(page).to have_content(/A/)
  end
end