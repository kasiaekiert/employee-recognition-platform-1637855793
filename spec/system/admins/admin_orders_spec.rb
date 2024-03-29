# frozen_string_literal: true

require 'rails_helper'
require 'csv'

RSpec.describe 'Orders' do
  let!(:employee) { create(:employee) }
  let!(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    sign_in employee
    allow_any_instance_of(Employee).to receive(:earned_points).and_return(1500)
  end

  it 'admin can see the list of bought rewards' do
    # employee buy reward
    visit('/')
    click_link 'Rewards'
    expect(page).to have_content 'January the best employee'

    click_button 'Order this reward'
    expect(page).to have_content 'Your purchase was successful.'

    visit('/')
    click_link 'Bought rewards'
    expect(page).to have_content 'Bought rewards'
    expect(page).to have_content 'January the best employee'

    sign_out employee
    sign_in admin
    # admin change the name of the reward
    visit('/')
    click_link 'Admin Panel'
    click_link 'Rewards'
    click_link 'Edit this Reward'
    fill_in 'Title', with: 'Title changed'
    click_button 'Update Reward'
    expect(page).to have_content 'Reward was successfully updated.'
    visit('/')
    click_link 'Admin Panel'
    click_link 'Orders'
    # admin see old name of reward in orders
    expect(page).to have_content 'Bought Rewards'
    expect(page).to have_content 'January the best employee'
    visit('/')
    click_link 'Admin Panel'
    click_link 'Orders'
    click_button('Deliver', match: :first)
    # admin may deliver the order
    expect(page).to have_content 'Order delivered'

    visit('/')
    click_link 'Admin Panel'
    click_link 'Orders'
    click_link 'Export Orders'
    # admin may export csv file with orders
    expect(body).to include('Employee', 'Title', 'Description', 'Date', 'Status')
    expect(body).to include(employee.email, reward.title, reward.description)
  end
end
