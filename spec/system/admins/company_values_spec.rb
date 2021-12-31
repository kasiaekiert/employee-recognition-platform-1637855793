# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudos' do
  let(:admin) { create(:admin) }

  before do
    sign_in admin
  end

  it 'All CRUD Company Values' do
    visit('/admins')
    click_link 'Admin Panel'
    click_link 'Company Values'
    click_link 'New Company Value'
    fill_in 'Title', with: 'Company Value title'
    click_button 'Create Company value'
    expect(page).to have_content 'New Company Value was successfully created.'

    visit('/admins')
    click_link 'Company Values'

    expect(page).to have_content 'Company Values'

    visit('/admins')
    click_link 'Company Values'
    click_link 'Edit this Company Value'
    fill_in 'Title', with: 'Company Value title 123'
    click_button 'Update Company value'

    expect(page).to have_content 'Company Value was successfully updated.'

    visit('/admins')
    click_link 'Company Values'
    click_link 'Destroy this Company Value'
    expect(page).to have_content 'Company Value was successfully destroyed.'
  end
end
