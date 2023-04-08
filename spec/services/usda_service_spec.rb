require 'rails_helper'

RSpec.describe UsdaService do
  describe 'instance methods' do
    describe '#food_search' do
      it 'returns food data for the searched food' do
        service = UsdaService.new('sweet potatoes')
        response = service.food_search

        expect(response).to be_a(Hash)
        expect(response).to have_key(:totalHits)
        expect(response).to have_key(:foods)
        expect(response[:foods]).to be_an(Array)
        expect(response[:foods].first).to be_a(Hash)
        expect(response[:foods].first).to have_key(:gtinUpc)
        expect(response[:foods].first).to have_key(:description)
        expect(response[:foods].first).to have_key(:brandOwner)
        expect(response[:foods].first).to have_key(:ingredients)
      end
    end
  end
end