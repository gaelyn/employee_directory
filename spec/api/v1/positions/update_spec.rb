require 'rails_helper'

RSpec.describe "positions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "y/positions/#{position.id}", payload
  end

  describe 'basic update' do
    let!(:position) { create(:position) }

    let(:payload) do
      {
        data: {
          id: position.id.to_s,
          type: 'positions',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PositionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { position.reload.attributes }
    end
  end
end
