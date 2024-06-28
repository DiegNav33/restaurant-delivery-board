require_relative "../views/employees_view"

class SessionsController

  def initialize(repository)
    @repository = repository
    @view = EmployeesView.new
  end

  def login
    username = @view.ask_user_username
    password = @view.ask_user_password
    employee = @repository.find_by_username(username)
    return employee if employee && employee.password == password
    @view.error_login
    login
  end
end
