require 'rails_helper'

feature 'Visitor view customers' do
  scenario 'successfully' do
    visit  root_path
    click_on 'Clientes'

  expect(page).to have_content('HTML index')  
  end
end