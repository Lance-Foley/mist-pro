require "test_helper"

class CostCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cost_code = cost_codes(:one)
  end

  test "should get index" do
    get cost_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_cost_code_url
    assert_response :success
  end

  test "should create cost_code" do
    assert_difference("CostCode.count") do
      post cost_codes_url, params: {cost_code: {code: @cost_code.code, id_number: @cost_code.id_number, name: @cost_code.name}}
    end

    assert_redirected_to cost_code_url(CostCode.last)
  end

  test "should show cost_code" do
    get cost_code_url(@cost_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_cost_code_url(@cost_code)
    assert_response :success
  end

  test "should update cost_code" do
    patch cost_code_url(@cost_code), params: {cost_code: {code: @cost_code.code, id_number: @cost_code.id_number, name: @cost_code.name}}
    assert_redirected_to cost_code_url(@cost_code)
  end

  test "should destroy cost_code" do
    assert_difference("CostCode.count", -1) do
      delete cost_code_url(@cost_code)
    end

    assert_redirected_to cost_codes_url
  end
end
