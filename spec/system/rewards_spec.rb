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
    expect(page).to have_css('div.pagination')

    visit('/')
    click_link 'Rewards'
    click_link reward.title

    expect(page).to have_content "Title: #{reward.title}"
  end

  it 'can not buy a reward they cannot afford' do
    visit('/')
    click_link 'Rewards'

    expect(page).to have_content 'Rewards'
    expect(page).to have_button('Order this reward', disabled: true)
  end

  context 'when filter by category' do
    let(:category1) { create(:category, title: 'Voucher') }
    let(:category2) { create(:category, title: 'Event') }
    let(:reward1) { create(:reward, title: 'Cinema Voucher') }
    let(:reward2) { create(:reward, title: 'Event in circus') }

    before do
      reward1.categories << category1
      reward2.categories << category2
    end

    it 'displays rewards filtered by selected category' do
      visit('/')
      click_link 'Rewards'
      click_link category1.title

      expect(page).to have_content reward1.title.to_s
      expect(page).not_to have_content reward2.title.to_s
    end

    it 'displays all rewards after selecting All button' do
      visit('/')
      click_link 'Rewards'
      click_link 'All'

      expect(page).to have_content reward1.title.to_s
      expect(page).to have_content reward2.title.to_s
    end
  end
end
