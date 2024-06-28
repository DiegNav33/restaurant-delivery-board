require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController

  def initialize(repository)
    @repository = repository
    @view = MealsView.new
  end

  def list
    if @repository.meals.empty?
      @view.message_empty_list
    else
      display_meals
    end
  end

  def add
    name = @view.ask_user_name
    price = @view.ask_user_price
    meal = Meal.new(name: name, price: price)
    @repository.create(meal)
  end

  def remove
    display_meals
    unless @repository.meals.empty?
      index = @view.ask_user_index
      if index >= 0 && index < @repository.meals.length
        @repository.destroy(index)
      else
        @view.error_message
      end
    end
  end

  def update
    display_meals
    unless @repository.meals.empty?
      index = @view.ask_user_index
      if index >= 0 && index < @repository.meals.length
        new_name = @view.ask_user_name
        new_price = @view.ask_user_price
        @repository.edit(index, name: new_name, price: new_price)
      else
        @view.error_message
      end
    end
  end

  private

  def display_meals
    meals = @repository.all
    @view.display_meals(meals)
  end
end
