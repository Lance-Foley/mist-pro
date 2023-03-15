require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference("Employee.count") do
      post employees_url, params: {employee: {crew_id: @employee.crew_id, first_name: @employee.first_name, hire_date: @employee.hire_date, hours: @employee.hours, last_name: @employee.last_name, status: @employee.status, wage: @employee.wage}}
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: {employee: {crew_id: @employee.crew_id, first_name: @employee.first_name, hire_date: @employee.hire_date, hours: @employee.hours, last_name: @employee.last_name, status: @employee.status, wage: @employee.wage}}
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference("Employee.count", -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
