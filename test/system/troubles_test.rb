require "application_system_test_case"

class TroublesTest < ApplicationSystemTestCase
  setup do
    @trouble = troubles(:one)
  end

  test "visiting the index" do
    visit troubles_url
    assert_selector "h1", text: "Troubles"
  end

  test "creating a Trouble" do
    visit troubles_url
    click_on "New Trouble"

    fill_in "Reference", with: @trouble.reference
    fill_in "Solution", with: @trouble.solution
    fill_in "User", with: @trouble.user_id
    click_on "Create Trouble"

    assert_text "Trouble was successfully created"
    click_on "Back"
  end

  test "updating a Trouble" do
    visit troubles_url
    click_on "Edit", match: :first

    fill_in "Reference", with: @trouble.reference
    fill_in "Solution", with: @trouble.solution
    fill_in "User", with: @trouble.user_id
    click_on "Update Trouble"

    assert_text "Trouble was successfully updated"
    click_on "Back"
  end

  test "destroying a Trouble" do
    visit troubles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trouble was successfully destroyed"
  end
end
