# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'price validation' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end

  describe '.paginate' do
    subject(:entries) { described_class.paginate(page: 3, per_page: 2) }

    let!(:reward1) { FactoryBot.create(:reward) }
    let!(:reward2) { FactoryBot.create(:reward) }
    let!(:reward3) { FactoryBot.create(:reward) }
    let!(:reward4) { FactoryBot.create(:reward) }
    let!(:reward5) { FactoryBot.create(:reward) }
    let!(:reward6) { FactoryBot.create(:reward) }
    let!(:reward7) { FactoryBot.create(:reward) }

    it { is_expected.to eq([reward5, reward6]) }

    it 'contains total pages' do
      expect(entries.total_pages).to be(4)
    end

    it 'contains current page' do
      expect(entries.current_page).to be(3)
    end
  end
end
