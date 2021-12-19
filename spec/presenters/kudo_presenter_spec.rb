# frozen_string_literal: true

require 'rails_helper'

RSpec.describe KudoPresenter do
  let!(:employee1) { create(:employee, email: 'aaaemail@test.com') }
  let!(:employee2) { create(:employee, email: 'zzzemail@test.com') }

  describe '#employees_for_select' do
    described_class { described_class.new.employees_for_select }

    it 'orders employees' do
      expect(described_class).to match_array [employee1, employee2]
    end
  end
end
