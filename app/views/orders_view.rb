class OrdersView

  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.employee.username} must deliver #{order.meal.name} to #{order.customer.name} at the following adress: #{order.customer.address}"
    end
  end

  def ask_user_index
    puts "Pick with the Index number!"
    return gets.chomp.to_i - 1
  end

  def message_empty_list
    puts "┌───────────────────────────────────────┐"
    puts "│      There is no orders yet !         |"
    puts "└───────────────────────────────────────┘"
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end
end
