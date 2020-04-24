require 'rails_helper'

feature 'Edit subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'Nome', with: 'RR Cars'
    fill_in 'Endereço', with: 'Rua General Rails'
    click_on 'Enviar'

    expect(page).to have_content('RR Cars')
  end

  scenario 'no blank' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('O campo não pode ficar em branco')
  end

  scenario 'succefully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')
    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'
    click_on 'Editar'
    fill_in 'CNPJ', with: '123'
    click_on 'Enviar'

    expect(page).to have_content('CNPJ inválido--Exemplo:xx.xxx.911/0001-xx')
  end  

end