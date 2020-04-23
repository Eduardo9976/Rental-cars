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
  end
end