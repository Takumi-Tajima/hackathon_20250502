class MealKetsController < ApplicationController
  def index
    @meal_kets = MealKet.published.default_order
  end

  def show
    @meal_ket = MealKet.published.find(params.expect(:id))
  end
end
