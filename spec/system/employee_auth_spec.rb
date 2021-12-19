# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employee auth actions' do
  let(:employee) { build(:employee) }

  it 'Setup employee account' do
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    fill_in 'Password confirmation', with: employee.password
    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
    expect(page).to have_content employee.email.to_s

    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'

    click_link 'Log in'
    fill_in 'Email', with: employee.email
    fill_in 'Password', with: employee.password
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
