class Employee

  attr_accessor :id
  attr_reader :username, :role, :password

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end
end
