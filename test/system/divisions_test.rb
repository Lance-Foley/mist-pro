require "application_system_test_case"

class DivisionsTest < ApplicationSystemTestCase
  setup do
    @division = divisions(:one)
  end

  test "visiting the index" do
    visit divisions_url
    assert_selector "h1", text: "Divisions"
  end

  test "creating a Division" do
    visit divisions_url
    click_on "New Division"

    fill_in "Name", with: @division.name
    fill_in "Overtime after", with: @division.overtime_after
    fill_in "Overtime rate", with: @division.overtime_rate
    fill_in "Utlization rate", with: @division.utlization_rate
    click_on "Create Division"

    assert_text "Division was successfully created"
    assert_selector "h1", text: "Divisions"
  end

  test "updating a Division" do
    visit division_url(@division)
    click_on "Edit", match: :first

    fill_in "Name", with: @division.name
    fill_in "Overtime after", with: @division.overtime_after
    fill_in "Overtime rate", with: @division.overtime_rate
    fill_in "Utlization rate", with: @division.utlization_rate
    click_on "Update Division"

    assert_text "Division was successfully updated"
    assert_selector "h1", text: "Divisions"
  end

  test "destroying a Division" do
    visit edit_division_url(@division)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Division was successfully destroyed"
  end
end
