# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'price validation' do
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(1) }
  end
end
