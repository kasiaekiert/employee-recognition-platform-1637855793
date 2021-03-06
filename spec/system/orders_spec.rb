# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders' do
  let(:employee) { create(:employee) }
  let(:admin) { create(:admin) }
  let!(:reward) { create(:reward) }

  before do
    sign_in employee
    allow_any_instance_of(Employee).to receive(:earned_points).and_return(1500)
  end

  it 'can see the list of bought rewards' do
    # user buy reward
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
    # admin change the title of this reward
    visit('/')
    click_link 'Admin Panel'
    click_link 'Rewards'
    click_link 'Edit this Reward'
    fill_in 'Title', with: 'Title changed'
    click_button 'Update Reward'
    expect(page).to have_content 'Reward was successfully updated.'

    sign_out admin
    sign_in employee
    visit('/')
    click_link 'Bought rewards'
    # the title of order did not change
    expect(page).to have_content 'Bought rewards'
    expect(page).to have_content 'January the best employee'

    sign_out employee
    sign_in admin
    # admin change the status
    visit('/')
    click_link 'Admin Panel'
    click_link 'Orders'
    click_button('Deliver', match: :first)
    # admin may deliver the order
    expect(page).to have_content 'Order delivered'

    sign_out admin
    sign_in employee
    visit('/')
    # filtering on click
    click_link 'Bought rewards'
    click_link 'Delivered'
    expect(page).to have_content 'Bought rewards'
    expect(page).to have_content 'January the best employee'
    visit('/')
    click_link 'Bought rewards'
    click_link 'Not delivered'
    expect(page).to have_content 'Bought rewards'
    expect(page).not_to have_content 'January the best employee'
  end
end
