# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee auth actions' do
  let(:admin) { create(:admin) }

  it 'can log in as an admin' do
    visit admin_root_path
    click_link 'Admin Panel'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'

    visit admin_root_path
    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end
