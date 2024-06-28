class MealsView

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. |🍽️ : #{meal.name} => 💲: #{meal.price}€|"
    end
  end

  def ask_user_name
    puts "Enter a meal's name"
    return gets.chomp.capitalize
  end

  def ask_user_price
    puts "Enter the meal's price"
    return gets.chomp.to_i
  end

  def ask_user_index
    puts "Pick with the Index number!"
    return gets.chomp.to_i - 1
  end

  def message_empty_list
    puts "┌───────────────────────────────────────┐"
    puts "│      There is no meals yet !          |"
    puts "└───────────────────────────────────────┘"
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end
end
