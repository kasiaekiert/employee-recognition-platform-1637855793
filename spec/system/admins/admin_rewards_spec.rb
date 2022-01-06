# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rewards' do
  let(:admin) { create(:admin) }
  let(:reward) { create(:reward) }

  before do
    sign_in admin
  end

  it 'Add reward' do
    visit('/admins')
    click_link 'Admin Panel'
    click_link 'Rewards'
    click_link 'New Admin reward'
    fill_in 'Title', with: 'Reward title'
    fill_in 'Description', with: 'Reward description 1'
    fill_in 'Price', with: '1000'
    click_button 'Create Reward'
    expect(page).to have_content 'Reward was successfully created.'

    visit('/admins')
    click_link 'Rewards'

    expect(page).to have_content 'Admins Panel: Rewards'

    visit('/admins')
    click_link 'Rewards'
    click_link('Edit this Reward', match: :first)
    fill_in 'Title', with: 'Reward title 123'
    click_button 'Update Reward'

    expect(page).to have_content 'Reward was successfully updated.'

    visit('/admins')
    click_link 'Rewards'
    click_link('Destroy this reward', match: :first)
    expect(page).to have_content 'Reward was successfully destroyed.'

    visit('/admins')
    click_link 'Admin Panel'
    click_link 'Rewards'
    click_link 'New Admin reward'
    fill_in 'Title', with: 'Reward title'
    fill_in 'Description', with: 'Reward description 1'
    fill_in 'Price', with: '0'
    click_button 'Create Reward'
    expect(page).to have_content 'Price must be greater than or equal to 1'
  end
end
