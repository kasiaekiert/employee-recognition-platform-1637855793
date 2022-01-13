# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rewards' do
  let(:employee) { create(:employee) }
  let!(:reward) { create(:reward) }

  before do
    sign_in employee
  end

  it 'can see rewards' do
    visit('/')
    click_link 'Rewards'

    expect(page).to have_content 'Rewards'

    visit('/')
    click_link 'Rewards'
    click_link reward.title

    expect(page).to have_content "Title: #{reward.title}"
  end
end
