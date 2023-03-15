require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "creating a Job" do
    visit jobs_url
    click_on "New Job"

    fill_in "Actual hours", with: @job.actual_hours
    fill_in "Bid hours", with: @job.bid_hours
    fill_in "Cost", with: @job.cost
    fill_in "Cost code", with: @job.cost_code_id
    fill_in "End date", with: @job.end_date
    fill_in "Name", with: @job.name
    fill_in "Start date", with: @job.start_date
    click_on "Create Job"

    assert_text "Job was successfully created"
    assert_selector "h1", text: "Jobs"
  end

  test "updating a Job" do
    visit job_url(@job)
    click_on "Edit", match: :first

    fill_in "Actual hours", with: @job.actual_hours
    fill_in "Bid hours", with: @job.bid_hours
    fill_in "Cost", with: @job.cost
    fill_in "Cost code", with: @job.cost_code_id
    fill_in "End date", with: @job.end_date
    fill_in "Name", with: @job.name
    fill_in "Start date", with: @job.start_date
    click_on "Update Job"

    assert_text "Job was successfully updated"
    assert_selector "h1", text: "Jobs"
  end

  test "destroying a Job" do
    visit edit_job_url(@job)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Job was successfully destroyed"
  end
end
