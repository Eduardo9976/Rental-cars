require 'rails_helper'

feature 'User search customer' do
  scenario 'Sucessfully' do

    user = User.create!(email: 'paula23@teste.com', password: '12345678' )
    customer = Customer.create!(name: 'Paula', cpf:'142.917.480-35', email: 'paula23@teste.com' )
    other_customer = Customer.create!(name: 'João', cpf:'825.145.960-50', email: 'joao23@teste.com' )
    
    
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: customer.cpf
    click_on 'Pesquisar'
    
    expect(page).to have_content('142.917.480-35')
    expect(page).not_to have_content('825.145.960-50')
  end  
end  