require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: {project: {amount_down: @project.amount_down, amount_down_date: @project.amount_down_date, amount_with_held: @project.amount_with_held, amount_with_held_date: @project.amount_with_held_date, client_id: @project.client_id, contact_info: @project.contact_info, cost: @project.cost, end_date: @project.end_date, name: @project.name, start_date: @project.start_date, status: @project.status, type: @project.category}}
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: {project: {amount_down: @project.amount_down, amount_down_date: @project.amount_down_date, amount_with_held: @project.amount_with_held, amount_with_held_date: @project.amount_with_held_date, client_id: @project.client_id, contact_info: @project.contact_info, cost: @project.cost, end_date: @project.end_date, name: @project.name, start_date: @project.start_date, status: @project.status, type: @project.category}}
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
