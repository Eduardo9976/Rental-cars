require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'94.382.302/0001-15', address:'Rua dos Pinheiros')
    
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Morumbi Car')
    expect(page).to have_content('Pinheiros Car')
  end

  scenario 'and no sibsidiares are created' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'94.382.302/0001-15', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Morumbi Car'

    expect(page).to have_content('Morumbi Car')
    expect(page).not_to have_content('Pinheiros Car')
  end
  
  scenario 'and no subsidiares are created' do
    visit root_path
    click_on 'Filiais'

  expect(page).to have_content('Nenhuma filial cadastrado')
  end
  
  scenario 'and return to home page' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'94.382.302/0001-15', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  
  scenario 'and return subsidiaries page' do
    Subsidiary.create!(name:'Morumbi Car', cnpj:'10.270.911/0001-92', address:'Rua Santo Antonio')
    Subsidiary.create!(name:'Pinheiros Car', cnpj:'94.382.302/0001-15', address:'Rua dos Pinheiros')

    visit root_path
    click_on 'Filiais'
    click_on 'Pinheiros Car'
    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end  
    
end