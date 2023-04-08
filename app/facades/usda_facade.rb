class UsdaFacade
  def initialize(food)
    @food = food
  end

  def service
    @_service ||= UsdaService.new(@food)
  end
  
  def food_response
    @_food_response ||= service.food_search
  end

  def total_hits
    food_response[:totalHits]
  end

  def food_search
    food_response[:foods].map do |food_data|
      Food.new(food_data)
    end
  end
end