require "application_system_test_case"

class ChangeOrdersTest < ApplicationSystemTestCase
  setup do
    @change_order = change_orders(:one)
  end

  test "visiting the index" do
    visit change_orders_url
    assert_selector "h1", text: "Change Orders"
  end

  test "creating a Change order" do
    visit change_orders_url
    click_on "New Change Order"

    fill_in "Amount down", with: @change_order.amount_down
    fill_in "Amount down date", with: @change_order.amount_down_date
    fill_in "Amount with held", with: @change_order.amount_with_held
    fill_in "Amount with held date", with: @change_order.amount_with_held_date
    fill_in "Cost", with: @change_order.cost
    fill_in "End date", with: @change_order.end_date
    fill_in "Name", with: @change_order.name
    fill_in "Project", with: @change_order.project_id
    fill_in "Start date", with: @change_order.start_date
    click_on "Create Change order"

    assert_text "Change order was successfully created"
    assert_selector "h1", text: "Change Orders"
  end

  test "updating a Change order" do
    visit change_order_url(@change_order)
    click_on "Edit", match: :first

    fill_in "Amount down", with: @change_order.amount_down
    fill_in "Amount down date", with: @change_order.amount_down_date
    fill_in "Amount with held", with: @change_order.amount_with_held
    fill_in "Amount with held date", with: @change_order.amount_with_held_date
    fill_in "Cost", with: @change_order.cost
    fill_in "End date", with: @change_order.end_date
    fill_in "Name", with: @change_order.name
    fill_in "Project", with: @change_order.project_id
    fill_in "Start date", with: @change_order.start_date
    click_on "Update Change order"

    assert_text "Change order was successfully updated"
    assert_selector "h1", text: "Change Orders"
  end

  test "destroying a Change order" do
    visit edit_change_order_url(@change_order)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Change order was successfully destroyed"
  end
end
