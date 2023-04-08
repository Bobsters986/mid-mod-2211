class UsdaService
  attr_reader :food

  def initialize(food)
    @food = food
  end

  def food_search
    get_url("/fdc/v1/foods/search")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private

  def conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['USDA_API_KEY']
      faraday.params["ingredients"] = @food
      faraday.params["pageSize"] = 10
    end
  end
end