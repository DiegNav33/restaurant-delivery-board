class CustomersView

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. |👤: #{customer.name} => 🏠: #{customer.address}|"
    end
  end

  def ask_user_name
    puts "What's the customer's name?"
    return gets.chomp
  end

  def ask_user_address
    puts "What's the customer's address?"
    return gets.chomp
  end

  def ask_user_index
    puts "Pick with the Index number!"
    return gets.chomp.to_i - 1
  end

  def message_empty_list
    puts "┌───────────────────────────────────────┐"
    puts "│     There is no customers yet !       |"
    puts "└───────────────────────────────────────┘"
  end

  def error_message
    puts "┌──────────────────────────────────────────┐"
    puts "│ ⚠️  An error occurred, please try again!  │"
    puts "└──────────────────────────────────────────┘"
  end
end
