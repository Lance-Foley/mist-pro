require "test_helper"

class TempCrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temp_crew = temp_crews(:one)
  end

  test "should get index" do
    get temp_crews_url
    assert_response :success
  end

  test "should get new" do
    get new_temp_crew_url
    assert_response :success
  end

  test "should create temp_crew" do
    assert_difference("TempCrew.count") do
      post temp_crews_url, params: {temp_crew: {crew_id: @temp_crew.crew_id, end_date: @temp_crew.end_date, job_id: @temp_crew.job_id, name: @temp_crew.name, start_date: @temp_crew.start_date}}
    end

    assert_redirected_to temp_crew_url(TempCrew.last)
  end

  test "should show temp_crew" do
    get temp_crew_url(@temp_crew)
    assert_response :success
  end

  test "should get edit" do
    get edit_temp_crew_url(@temp_crew)
    assert_response :success
  end

  test "should update temp_crew" do
    patch temp_crew_url(@temp_crew), params: {temp_crew: {crew_id: @temp_crew.crew_id, end_date: @temp_crew.end_date, job_id: @temp_crew.job_id, name: @temp_crew.name, start_date: @temp_crew.start_date}}
    assert_redirected_to temp_crew_url(@temp_crew)
  end

  test "should destroy temp_crew" do
    assert_difference("TempCrew.count", -1) do
      delete temp_crew_url(@temp_crew)
    end

    assert_redirected_to temp_crews_url
  end
end
