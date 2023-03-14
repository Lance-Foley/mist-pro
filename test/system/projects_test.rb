require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Amount down", with: @project.amount_down
    fill_in "Amount down date", with: @project.amount_down_date
    fill_in "Amount with held", with: @project.amount_with_held
    fill_in "Amount with held date", with: @project.amount_with_held_date
    fill_in "Client", with: @project.client_id
    fill_in "Contact info", with: @project.contact_info
    fill_in "Cost", with: @project.cost
    fill_in "End date", with: @project.end_date
    fill_in "Name", with: @project.name
    fill_in "Start date", with: @project.start_date
    check "Status" if @project.status
    fill_in "Type", with: @project.type
    click_on "Create Project"

    assert_text "Project was successfully created"
    assert_selector "h1", text: "Projects"
  end

  test "updating a Project" do
    visit project_url(@project)
    click_on "Edit", match: :first

    fill_in "Amount down", with: @project.amount_down
    fill_in "Amount down date", with: @project.amount_down_date
    fill_in "Amount with held", with: @project.amount_with_held
    fill_in "Amount with held date", with: @project.amount_with_held_date
    fill_in "Client", with: @project.client_id
    fill_in "Contact info", with: @project.contact_info
    fill_in "Cost", with: @project.cost
    fill_in "End date", with: @project.end_date
    fill_in "Name", with: @project.name
    fill_in "Start date", with: @project.start_date
    check "Status" if @project.status
    fill_in "Type", with: @project.type
    click_on "Update Project"

    assert_text "Project was successfully updated"
    assert_selector "h1", text: "Projects"
  end

  test "destroying a Project" do
    visit edit_project_url(@project)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Project was successfully destroyed"
  end
end
