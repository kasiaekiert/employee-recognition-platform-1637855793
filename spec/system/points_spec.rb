# zalogowac 1 uzytkownika sprawdzic ile ma points -0
# wylogowac
# zalogowac2 , dodac kudo gdzie receiver bedzie uzytkownik 1
# wylogowac
# zalogowac na 1 uzytk. sprawdzic czy points sa 1

# You have: <%= current_employee.earned_points %>kudos

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
