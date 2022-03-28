# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#paginate' do
    subject(:paginate) { helper.paginate(result) }

    let(:result) do
      instance_double(
        Reward::PaginationResult, current_page: current_page, total_pages: 3
      )
    end
    let(:current_page) { 2 }

    it { is_expected.to include('<a href="/rewards?page=1">1</a>') }

    it { is_expected.to include('<a href="/rewards?page=3">3</a>') }
  end
end
