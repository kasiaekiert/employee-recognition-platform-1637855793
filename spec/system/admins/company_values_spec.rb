# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Company Values' do
  let(:admin) { create(:admin) }

  context 'when user is not an admin' do
    it 'cannot see the button in the navbar' do
      visit('/')
      expect(page).to have_no_link('Company Values')
    end
  end

  context 'when admin is logged in' do
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
      expect(page).to have_content 'New Company Value'

      visit('/admins')
      click_link 'Company Values'
      click_link 'Admin Panel'
      click_link 'Company Values'

      expect(page).to have_content 'Company Values'
      expect(page).to have_content 'New Company Value'

      visit('/admins')
      click_link 'Admin Panel'
      click_link 'Company Values'
      click_link 'Company Value title'

      expect(page).to have_content 'Title: Company Value title'

      visit('/admins')
      click_link 'Company Values'
      click_link 'Edit this Company Value'
      fill_in 'Title', with: 'Company Value title 123'
      click_button 'Update Company value'

      expect(page).to have_content 'Company Value was successfully updated.'
      expect(page).to have_content 'Company Value title 123'

      visit('/admins')
      click_link 'Company Values'
      click_link 'Destroy this Company Value'
      expect(page).to have_content 'Company Value was successfully destroyed.'
      expect(page).to have_no_content 'Company Value title 123'
      expect(page).to have_no_content 'Company Value title'
    end
  end
end
