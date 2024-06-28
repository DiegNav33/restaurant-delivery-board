require "csv"
require_relative "../models/customer"

class CustomerRepository

  attr_reader :customers

  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find {|customer| customer.id == id}
  end

  def destroy(index)
    @customers.delete_at(index)
    save_csv
  end

  def edit(index, new_attributes)
    customer = @customers[index]
    customer.name = new_attributes[:name] unless new_attributes[:name].empty?
    customer.address = new_attributes[:address] unless new_attributes[:address].empty?
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end
end
