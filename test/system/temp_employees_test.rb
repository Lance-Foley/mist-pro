require "application_system_test_case"

class TempEmployeesTest < ApplicationSystemTestCase
  setup do
    @temp_employee = temp_employees(:one)
  end

  test "visiting the index" do
    visit temp_employees_url
    assert_selector "h1", text: "Temp Employees"
  end

  test "creating a Temp employee" do
    visit temp_employees_url
    click_on "New Temp Employee"

    fill_in "Employee", with: @temp_employee.employee_id
    fill_in "End date", with: @temp_employee.end_date
    fill_in "Job", with: @temp_employee.job_id
    fill_in "Override hours", with: @temp_employee.override_hours
    fill_in "Override type", with: @temp_employee.override_type
    fill_in "Start date", with: @temp_employee.start_date
    fill_in "Temp crew", with: @temp_employee.temp_crew_id
    click_on "Create Temp employee"

    assert_text "Temp employee was successfully created"
    assert_selector "h1", text: "Temp Employees"
  end

  test "updating a Temp employee" do
    visit temp_employee_url(@temp_employee)
    click_on "Edit", match: :first

    fill_in "Employee", with: @temp_employee.employee_id
    fill_in "End date", with: @temp_employee.end_date
    fill_in "Job", with: @temp_employee.job_id
    fill_in "Override hours", with: @temp_employee.override_hours
    fill_in "Override type", with: @temp_employee.override_type
    fill_in "Start date", with: @temp_employee.start_date
    fill_in "Temp crew", with: @temp_employee.temp_crew_id
    click_on "Update Temp employee"

    assert_text "Temp employee was successfully updated"
    assert_selector "h1", text: "Temp Employees"
  end

  test "destroying a Temp employee" do
    visit edit_temp_employee_url(@temp_employee)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Temp employee was successfully destroyed"
  end
end
