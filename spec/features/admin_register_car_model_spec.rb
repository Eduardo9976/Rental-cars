require 'rails_helper'

feature 'Admin register car model' do
  scenario 'succefully'do
    #arrage
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, insurance: 20, third_insurance: 20)

    #act
    visit root_path
    click_on 'Modelos de Carros'
    click_on 'Cadastrar novo modelo de carro'

    fill_in 'Nome', with: 'Mobi'
    fill_in 'Combustível', with: 'Flex'
    fill_in 'Motor', with: '1.0'
    fill_in 'Ano', with: '2020'
    select 'Fiat', from: 'Fabricante'
    select 'A', from: 'Categoria'
    click_on 'Enviar'

    #assert
    expect(page).to have_content('Mobi')
    expect(page).to have_content('Fabricante: Fiat')
    expect(page).to have_content('Categoria: A')
    expect(page).to have_content('Combustível: Flex')
    expect(page).to have_content('Motor: 1.0')
    expect(page).to have_content('Ano: 2020')
  end
end