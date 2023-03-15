require "test_helper"

class TempEmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_employee = temp_employees(:one)
  end

  test "should get index" do
    get temp_employees_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_employee_url
    assert_response :success
  end

  test "should create temp_employee" do
    assert_difference("TempEmployee.count") do
      post temp_employees_url, params: {temp_employee: {employee_id: @temp_employee.employee_id, end_date: @temp_employee.end_date, job_id: @temp_employee.job_id, override_hours: @temp_employee.override_hours, override_type: @temp_employee.override_type, start_date: @temp_employee.start_date, temp_crew_id: @temp_employee.temp_crew_id}}
    end

    assert_redirected_to temp_employee_url(TempEmployee.last)
  end

  test "should show temp_employee" do
    get temp_employee_url(@temp_employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_employee_url(@temp_employee)
    assert_response :success
  end

  test "should update temp_employee" do
    patch temp_employee_url(@temp_employee), params: {temp_employee: {employee_id: @temp_employee.employee_id, end_date: @temp_employee.end_date, job_id: @temp_employee.job_id, override_hours: @temp_employee.override_hours, override_type: @temp_employee.override_type, start_date: @temp_employee.start_date, temp_crew_id: @temp_employee.temp_crew_id}}
    assert_redirected_to temp_employee_url(@temp_employee)
  end

  test "should destroy temp_employee" do
    assert_difference("TempEmployee.count", -1) do
      delete temp_employee_url(@temp_employee)
    end

    assert_redirected_to temp_employees_url
  end
end
