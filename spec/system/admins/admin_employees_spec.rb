# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Employees' do
  let(:admin) { create(:admin) }
  let(:employee1) { create(:employee, number_of_available_kudos: 2) }
  let(:employee2) { create(:employee, number_of_available_kudos: 4) }
  let(:employee3) { create(:employee, number_of_available_kudos: 6) }

  before do
    sign_in admin
  end

  it 'See the list of employees' do
    visit('/admins')
    click_link 'Admin Panel'
    click_link 'Employees'
    expect(page).to have_content 'Admin Panel: Employees'
    expect(employee1.number_of_available_kudos).to have_content '2'
    expect(employee2.number_of_available_kudos).to have_content '4'
    expect(employee3.number_of_available_kudos).to have_content '6'

    click_link 'Add kudos'
    fill_in 'Additional kudos for all employees:', with: '5'
    click_button 'Submit'
    expect(page).to have_content 'Employee was successfully updated.'
  end
end
