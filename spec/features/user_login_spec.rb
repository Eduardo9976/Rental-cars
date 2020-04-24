require 'rails_helper'

feature 'User log in'do
  scenario 'Succefully'do
    User.create!(email: 'teste@test.com.br', password: '12345678')
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    
    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).to have_content('Fabricante')
    expect(page).to have_content('Categorias carros')
    expect(page).to have_content('Modelos de Carros')
    expect(page).to have_content('Locações')
    expect(page).to have_content('Logout')
    expect(page).not_to have_content('Entrar')
  end
  scenario 'and log out' do
    User.create!(email: 'teste@test.com.br', password: '12345678')
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'teste@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Logout'
    
    expect(page).to have_content('Saiu com sucesso')
    expect(page).not_to have_link('Fabricante')
    expect(page).not_to have_link('Categorias carros')
    expect(page).not_to have_link('Modelos de Carros')
    expect(page).not_to have_link('Locações')
    expect(page).not_to have_link('Clientes')
    expect(page).not_to have_link('Logout')
    expect(page).to have_content('Entrar')
    
  end 
end