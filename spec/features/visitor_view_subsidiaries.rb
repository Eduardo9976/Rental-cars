require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
  end
end