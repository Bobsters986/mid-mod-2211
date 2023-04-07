require 'rails_helper'

RSpec.describe UsdaFacade do
  describe 'instance methods' do
    describe '#food_search' do
      it 'returns food data for the searched food' do
        facade = UsdaFacade.new
        response = facade.food_search('sweet potatoes')

        expect(response).to be_an(Array)
        expect(response.first).to be_a(Food)
        expect(response.first.gtin_upc).to eq("728229015529")
        expect(response.first.description).to eq("SWEETS MEDLEY SEL GRIS, BATATA, SWEET POTATO, PURPLE SWEET POTATO REAL VEGETABLE CHIPS, SWEETS MEDLEY")
        expect(response.first.brand_owner).to eq("The Hain Celestial Group, Inc.")
        expect(response.first.ingredients).to eq("A BLEND OF SWEET POTATOES (SWEET POTATO, PURPLE SWEET POTATO, BATATA), AVOCADO OIL, SEA SALT.")
        expect(response.size).to eq(10)
      end
    end

    describe '#total_hits' do
      it 'returns the total number of hits for the searched food' do
        facade = UsdaFacade.new
        response = facade.total_hits('sweet potatoes')

        expect(response).to be_an(Integer)
        expect(response).to eq(38114)
      end
    end
  end
end