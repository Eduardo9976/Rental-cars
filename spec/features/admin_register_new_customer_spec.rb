require 'rails_helper'

feature 'Admin register new customer' do
  scenario 'succefully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar novo cliente'
  
    fill_in 'Nome', with: 'Eduardo'
    fill_in 'CPF', with: '372.427.458.02'
    fill_in 'E-mail', with: 'eduardo_2407@me.com'
    click_on 'Enviar'

    expect(current_path).to eq customer_path(Customer.last.id)
    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_content('Eduardo')
    expect(page).to have_content('372.427.458.02')
    expect(page).to have_content('eduardo_2407@me.com')
    expect(page).to have_link('Voltar')
  end
end