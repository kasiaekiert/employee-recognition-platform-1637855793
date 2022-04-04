# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category' do
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  context 'when user is not an admin' do
    it 'cannot see the button in the navbar' do
      visit('/')
      expect(page).to have_no_link('Rewards Categories')
    end
  end

  context 'when admin is logged in' do
    before do
      sign_in admin
    end

    it 'admin can add category' do
      visit('/admins')
      click_link 'Admin Panel'
      click_link 'Rewards Categories'
      click_link 'New Category'
      fill_in 'Title', with: 'Rewards Category title'
      click_button 'Create Category'
      expect(page).to have_content 'New Category was successfully created.'
      expect(page).to have_content 'Rewards Category title'

      visit('/admins')
      click_link 'Rewards'
      click_link 'January the best employee'
      click_link 'Edit'
      page.check('Rewards Category title')
      click_button 'Update Reward'

      expect(page).to have_content 'Reward was successfully updated.'

      visit('/admins')
      click_link 'Rewards'
      click_link 'January the best employee'
      click_link 'Edit'
      expect(page).to have_checked_field('Rewards Category title')
    end
  end
end
