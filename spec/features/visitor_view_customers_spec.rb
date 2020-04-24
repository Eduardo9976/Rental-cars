require 'rails_helper'

feature 'Visitor view customers' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com.br', password:'12345678')

    login_as user, scope: :user
    visit  root_path
    click_on 'Clientes'

  expect(page).to have_content('Nenhum cliente cadastrado')  
  end
end