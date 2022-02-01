# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Points' do
  let(:employee) { create(:employee) }

  before do
    sign_in employee
  end

  it 'can check that how many kudos employee has got' do
    visit('/')

    expect(page).to have_content 'Your score 0'
    expect(page).to have_content employee.earned_points
  end
end
