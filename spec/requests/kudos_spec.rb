# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/kodos', type: :request do
  let(:employee) { create(:employee) }

  before do
    sign_in employee
  end

  describe 'GET /' do
    it 'renders a successful response' do
      get '/kudos'

      expect(response).to have_http_status(:ok)
    end
  end
end
