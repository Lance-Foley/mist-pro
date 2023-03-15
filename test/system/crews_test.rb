require "application_system_test_case"

class CrewsTest < ApplicationSystemTestCase
  setup do
    @crew = crews(:one)
  end

  test "visiting the index" do
    visit crews_url
    assert_selector "h1", text: "Crews"
  end

  test "creating a Crew" do
    visit crews_url
    click_on "New Crew"

    fill_in "Divsion", with: @crew.divsion_id
    fill_in "Leader", with: @crew.leader_id
    fill_in "Name", with: @crew.name
    click_on "Create Crew"

    assert_text "Crew was successfully created"
    assert_selector "h1", text: "Crews"
  end

  test "updating a Crew" do
    visit crew_url(@crew)
    click_on "Edit", match: :first

    fill_in "Divsion", with: @crew.divsion_id
    fill_in "Leader", with: @crew.leader_id
    fill_in "Name", with: @crew.name
    click_on "Update Crew"

    assert_text "Crew was successfully updated"
    assert_selector "h1", text: "Crews"
  end

  test "destroying a Crew" do
    visit edit_crew_url(@crew)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Crew was successfully destroyed"
  end
end
