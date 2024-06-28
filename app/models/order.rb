class Order

  attr_accessor :id, :meal, :customer, :employee, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered]
  end

  def delivered?
    @delivered == true
  end

  def deliver!
    @delivered = true
  end
end
