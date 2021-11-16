require 'rails_helper'

RSpec.describe "positions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "y/positions/#{position.id}"
  end

  describe 'basic destroy' do
    let!(:position) { create(:position) }

    it 'updates the resource' do
      expect(PositionResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Position.count }.by(-1)
      expect { position.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
