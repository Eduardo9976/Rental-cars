require 'rails_helper'

feature 'Admin register Car Categorie' do
  scenario 'from index page' do
    user = User.create!(email:'teste@teste.com.br', password:'12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias carros'

    expect(page).to have_link('Cadastrar nova Categoria', href: new_car_category_path) 
  end
  scenario 'succefully' do
    user = User.create!(email:'teste@teste.com.br', password:'12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Categorias carros'
    click_on 'Cadastrar nova Categoria'
  
    fill_in 'Nome', with: 'A'
    fill_in 'Diárias', with: '1'
    fill_in 'Seguro', with: '100'
    fill_in 'Seguro para terceiros', with: '20'
    click_on 'Enviar'

    expect(current_path).to eq car_category_path(CarCategory.last.id)
    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_content('A')
    expect(page).to have_link('Voltar')
  end  
end