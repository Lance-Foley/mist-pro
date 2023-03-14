require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Business phone", with: @client.business_phone
    fill_in "Cell phone", with: @client.cell_phone
    fill_in "Email", with: @client.email
    fill_in "Name", with: @client.name
    fill_in "Secondary business phone", with: @client.secondary_business_phone
    fill_in "Secondary cell phone", with: @client.secondary_cell_phone
    fill_in "Secondary email", with: @client.secondary_email
    fill_in "Secondary name", with: @client.secondary_name
    click_on "Create Client"

    assert_text "Client was successfully created"
    assert_selector "h1", text: "Clients"
  end

  test "updating a Client" do
    visit client_url(@client)
    click_on "Edit", match: :first

    fill_in "Business phone", with: @client.business_phone
    fill_in "Cell phone", with: @client.cell_phone
    fill_in "Email", with: @client.email
    fill_in "Name", with: @client.name
    fill_in "Secondary business phone", with: @client.secondary_business_phone
    fill_in "Secondary cell phone", with: @client.secondary_cell_phone
    fill_in "Secondary email", with: @client.secondary_email
    fill_in "Secondary name", with: @client.secondary_name
    click_on "Update Client"

    assert_text "Client was successfully updated"
    assert_selector "h1", text: "Clients"
  end

  test "destroying a Client" do
    visit edit_client_url(@client)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Client was successfully destroyed"
  end
end
