# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudos' do
  let(:admin) { create(:admin) }
  let!(:company_value) { create(:company_value) }

  before do
    sign_in admin
    create(:employee)
  end

  it 'Add kudo' do
    visit('/admins')
    click_link 'Admin Panel'
    click_link 'Kudos'
    click_link 'New Admin kudo'
    fill_in 'Title', with: 'Kudo title'
    fill_in 'Content', with: 'Kudo content 1'
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'

    visit('/admins')
    click_link 'Kudos'

    expect(page).to have_content 'Admins Kudos'

    visit('/admins')
    click_link 'Kudos'
    click_link 'Edit this Kudo'
    fill_in 'Title', with: 'Kudo title 123'
    click_button 'Update Kudo'

    expect(page).to have_content 'Kudo was successfully updated.'

    visit('/admins')
    click_link 'Kudos'
    click_link 'Edit this Kudo'
    select company_value.title, from: 'kudo_company_value_id'
    click_button 'Update Kudo'

    expect(page).to have_content 'Kudo was successfully updated.'

    visit('/admins')
    click_link 'Kudos'
    click_link 'Destroy this kudo'
    expect(page).to have_content 'Kudo was successfully destroyed.'
  end
end
