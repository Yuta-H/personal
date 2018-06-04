require "application_system_test_case"

class LoginIdsTest < ApplicationSystemTestCase
  setup do
    @login_id = login_ids(:one)
  end

  test "visiting the index" do
    visit login_ids_url
    assert_selector "h1", text: "Login Ids"
  end

  test "creating a Login" do
    visit login_ids_url
    click_on "New Login"

    fill_in "Authenticate Key", with: @login_id.authenticate_key
    fill_in "Secret", with: @login_id.secret_id
    click_on "Create Login"

    assert_text "Login was successfully created"
    click_on "Back"
  end

  test "updating a Login" do
    visit login_ids_url
    click_on "Edit", match: :first

    fill_in "Authenticate Key", with: @login_id.authenticate_key
    fill_in "Secret", with: @login_id.secret_id
    click_on "Update Login"

    assert_text "Login was successfully updated"
    click_on "Back"
  end

  test "destroying a Login" do
    visit login_ids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Login was successfully destroyed"
  end
end
