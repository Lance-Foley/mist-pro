require "application_system_test_case"

class CostCodesTest < ApplicationSystemTestCase
  setup do
    @cost_code = cost_codes(:one)
  end

  test "visiting the index" do
    visit cost_codes_url
    assert_selector "h1", text: "Cost Codes"
  end

  test "creating a Cost code" do
    visit cost_codes_url
    click_on "New Cost Code"

    fill_in "Code", with: @cost_code.code
    fill_in "Id number", with: @cost_code.id_number
    fill_in "Name", with: @cost_code.name
    click_on "Create Cost code"

    assert_text "Cost code was successfully created"
    assert_selector "h1", text: "Cost Codes"
  end

  test "updating a Cost code" do
    visit cost_code_url(@cost_code)
    click_on "Edit", match: :first

    fill_in "Code", with: @cost_code.code
    fill_in "Id number", with: @cost_code.id_number
    fill_in "Name", with: @cost_code.name
    click_on "Update Cost code"

    assert_text "Cost code was successfully updated"
    assert_selector "h1", text: "Cost Codes"
  end

  test "destroying a Cost code" do
    visit edit_cost_code_url(@cost_code)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Cost code was successfully destroyed"
  end
end
