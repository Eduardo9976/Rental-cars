require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and name must be unique' do
    user = User.create!(email: 'Teste@teste.com.br', password: '12345678')
    CarCategory.create(name: 'B', daily_rate: '2', insurance: '120', third_insurance: '30')
    
    login_as user, scope: :user
    visit root_path
    click_on 'Categorias carros'
    click_on 'Cadastrar nova Categoria'

    fill_in 'Nome', with: 'B'
    fill_in 'Diárias', with: '1'
    fill_in 'Seguro', with: '100'
    fill_in 'Seguro para terceiros', with: '20'
    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end

  scenario 'and name cant not be blank' do
    user = User.create!(email: 'Teste@teste.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias carros'
    click_on 'Cadastrar nova Categoria'

    fill_in 'Nome', with: ' '
    fill_in 'Diárias', with: '10 '
    fill_in 'Seguro', with: ' 5000'
    fill_in 'Seguro para terceiros', with: '500 '
    click_on 'Enviar'

    expect(page).to have_content('Não foi possível salvar')
    
  end
end