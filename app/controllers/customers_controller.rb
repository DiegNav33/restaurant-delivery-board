require_relative "../models/customer"
require_relative "../views/customers_view"

class CustomersController

  def initialize(repository)
    @repository = repository
    @view = CustomersView.new
  end

  def list
    if @repository.customers.empty?
      @view.message_empty_list
    else
      display_customers
    end
  end

  def add
    name = @view.ask_user_name
    address = @view.ask_user_address
    customer = Customer.new(name: name, address: address)
    @repository.create(customer)
  end

  def remove
    display_customers
    unless @repository.customers.empty?
      index = @view.ask_user_index
      if index >= 0 && index < @repository.customers.length
        @repository.destroy(index)
      else
        @view.error_message
      end
    end
  end

  def update
    display_customers
    unless @repository.customers.empty?
      index = @view.ask_user_index
      if index >= 0 && index < @repository.customers.length
        new_name = @view.ask_user_name
        new_address = @view.ask_user_address
        @repository.edit(index, name: new_name, address: new_address)
      else
        @view.error_message
      end
    end
  end

  private

  def display_customers
    customers = @repository.all
    @view.display_customers(customers)
  end
end
