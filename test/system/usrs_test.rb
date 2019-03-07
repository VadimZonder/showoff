require "application_system_test_case"

class UsrsTest < ApplicationSystemTestCase
  setup do
    @usr = usrs(:one)
  end

  test "visiting the index" do
    visit usrs_url
    assert_selector "h1", text: "Usrs"
  end

  test "creating a Usr" do
    visit usrs_url
    click_on "New Usr"

    fill_in "Email", with: @usr.email
    fill_in "Fname", with: @usr.fName
    fill_in "Lname", with: @usr.lName
    fill_in "Pass", with: @usr.pass
    click_on "Create Usr"

    assert_text "Usr was successfully created"
    click_on "Back"
  end

  test "updating a Usr" do
    visit usrs_url
    click_on "Edit", match: :first

    fill_in "Email", with: @usr.email
    fill_in "Fname", with: @usr.fName
    fill_in "Lname", with: @usr.lName
    fill_in "Pass", with: @usr.pass
    click_on "Update Usr"

    assert_text "Usr was successfully updated"
    click_on "Back"
  end

  test "destroying a Usr" do
    visit usrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usr was successfully destroyed"
  end
end
