require "application_system_test_case"

class TempCrewsTest < ApplicationSystemTestCase
  setup do
    @temp_crew = temp_crews(:one)
  end

  test "visiting the index" do
    visit temp_crews_url
    assert_selector "h1", text: "Temp Crews"
  end

  test "creating a Temp crew" do
    visit temp_crews_url
    click_on "New Temp Crew"

    fill_in "Crew", with: @temp_crew.crew_id
    fill_in "End date", with: @temp_crew.end_date
    fill_in "Job", with: @temp_crew.job_id
    fill_in "Name", with: @temp_crew.name
    fill_in "Start date", with: @temp_crew.start_date
    click_on "Create Temp crew"

    assert_text "Temp crew was successfully created"
    assert_selector "h1", text: "Temp Crews"
  end

  test "updating a Temp crew" do
    visit temp_crew_url(@temp_crew)
    click_on "Edit", match: :first

    fill_in "Crew", with: @temp_crew.crew_id
    fill_in "End date", with: @temp_crew.end_date
    fill_in "Job", with: @temp_crew.job_id
    fill_in "Name", with: @temp_crew.name
    fill_in "Start date", with: @temp_crew.start_date
    click_on "Update Temp crew"

    assert_text "Temp crew was successfully updated"
    assert_selector "h1", text: "Temp Crews"
  end

  test "destroying a Temp crew" do
    visit edit_temp_crew_url(@temp_crew)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Temp crew was successfully destroyed"
  end
end
