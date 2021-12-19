# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kudos' do
  let(:employee) { create(:employee) }

  before do
    sign_in employee
  end

  it 'Add kudo' do
    visit('/')
    click_link 'Kudos'
    click_link 'Create New Kudo'
    fill_in 'Title', with: 'Kudo title'
    fill_in 'Content', with: 'Kudo content 1'
    click_button 'Create Kudo'

    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_content 'Kudo title'

    visit('/')
    click_link 'Kudos'

    expect(page).to have_content 'Kudo title'

    visit('/')
    click_link 'Kudos'
    click_link 'Edit this Kudo'
    fill_in 'Title', with: 'Kudo title 123'
    click_button 'Update Kudo'

    expect(page).to have_content 'Kudo was successfully updated.'

    visit('/')
    click_link 'Kudos'
    click_link 'Destroy this kudo'
    expect(page).to have_content 'Kudo was successfully destroyed.'
  end
end
