require "csv"
require_relative "../models/meal"

class MealRepository

  attr_reader :meals

  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
  end

  def all
    @meals
  end

  def find(id)
    @meals.find {|meal| meal.id == id}
  end

  def destroy(index)
    @meals.delete_at(index)
    save_csv
  end

  def edit(index, new_attributes)
    meal = @meals[index]
    meal.name = new_attributes[:name] unless new_attributes[:name].empty?
    meal.price = new_attributes[:price] unless new_attributes[:price].nil?
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
