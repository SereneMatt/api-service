require 'rails_helper'

RSpec.describe 'expense API', type: :request do
  # Initialize test data
  let!(:expenses) { create_list(:expense, 10) }
  let(:expense_id) { expenses.first.id }

  # Test suite for POST /expenses
  describe 'POST /expenses' do
    # valid
    let(:valid_attributes) { { spent_for: 'Grocery', amount: '20.0' } }

    context 'when the request is valid' do
      before { post '/api/v1/expenses', params: valid_attributes }

      it 'creates an expense' do
        expect(json['spent_for']).to eq('Grocery')
        expect(json['amount']).to eq('20.0')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/expenses', params: { spent_for: 'Grocery' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Amount can't be blank\"}")
      end
    end
  end
end