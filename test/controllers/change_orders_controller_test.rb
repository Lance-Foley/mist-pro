require "test_helper"

class ChangeOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @change_order = change_orders(:one)
  end

  test "should get index" do
    get change_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_change_order_url
    assert_response :success
  end

  test "should create change_order" do
    assert_difference("ChangeOrder.count") do
      post change_orders_url, params: {change_order: {amount_down: @change_order.amount_down, amount_down_date: @change_order.amount_down_date, amount_with_held: @change_order.amount_with_held, amount_with_held_date: @change_order.amount_with_held_date, cost: @change_order.cost, end_date: @change_order.end_date, name: @change_order.name, project_id: @change_order.project_id, start_date: @change_order.start_date}}
    end

    assert_redirected_to change_order_url(ChangeOrder.last)
  end

  test "should show change_order" do
    get change_order_url(@change_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_change_order_url(@change_order)
    assert_response :success
  end

  test "should update change_order" do
    patch change_order_url(@change_order), params: {change_order: {amount_down: @change_order.amount_down, amount_down_date: @change_order.amount_down_date, amount_with_held: @change_order.amount_with_held, amount_with_held_date: @change_order.amount_with_held_date, cost: @change_order.cost, end_date: @change_order.end_date, name: @change_order.name, project_id: @change_order.project_id, start_date: @change_order.start_date}}
    assert_redirected_to change_order_url(@change_order)
  end

  test "should destroy change_order" do
    assert_difference("ChangeOrder.count", -1) do
      delete change_order_url(@change_order)
    end

    assert_redirected_to change_orders_url
  end
end
