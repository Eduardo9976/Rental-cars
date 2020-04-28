require 'rails_helper'

feature 'Admin performs partial search' do
  scenario 'successfully' do
    user = User.create!(email: 'paula23@teste.com', password: '12345678' )
    customer = Customer.create!(name: 'Paula Dias', cpf:'142.917.480-35', email: 'paula23@teste.com' )
    other_customer = Customer.create!(name: 'João Dias', cpf:'825.145.960-50', email: 'joao23@teste.com' )
    
    
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: 'Paula'
    click_on 'Pesquisar'

    expect(page).to have_content('Paula Dias')
    expect(page).to have_content('142.917.480-35')
    expect(page).not_to have_content('João Dias')
    expect(page).not_to have_content('825.145.960-50')
  end

  scenario 'Count search result' do
    user = User.create!(email: 'paula23@teste.com', password: '12345678' )
    customer = Customer.create!(name: 'Paula Dias', cpf:'142.917.480-35', email: 'paula23@teste.com' )
    other_customer = Customer.create!(name: 'João Dias', cpf:'825.145.960-50', email: 'joao23@teste.com' )
    
    
    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: 'Dias'
    click_on 'Pesquisar'

    expect(page).to have_content ("O resultado da busca por: Dias")
    expect(page).to have_content ("Número de resultados encontrados: 2")
    expect(current_path).to eq search_customers_path
  end

end