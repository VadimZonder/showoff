require "application_system_test_case"

class DeletesTest < ApplicationSystemTestCase
  setup do
    @delete = deletes(:one)
  end

  test "visiting the index" do
    visit deletes_url
    assert_selector "h1", text: "Deletes"
  end

  test "creating a Delete" do
    visit deletes_url
    click_on "New Delete"

    fill_in "Delete", with: @delete.delete
    click_on "Create Delete"

    assert_text "Delete was successfully created"
    click_on "Back"
  end

  test "updating a Delete" do
    visit deletes_url
    click_on "Edit", match: :first

    fill_in "Delete", with: @delete.delete
    click_on "Update Delete"

    assert_text "Delete was successfully updated"
    click_on "Back"
  end

  test "destroying a Delete" do
    visit deletes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delete was successfully destroyed"
  end
end
