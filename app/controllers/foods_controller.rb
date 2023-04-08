class FoodsController < ApplicationController
  def index
    @food_facade = UsdaFacade.new(params[:q])
  end
end