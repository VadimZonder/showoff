require "application_system_test_case"

class IsFTpsTest < ApplicationSystemTestCase
  setup do
    @is_f_tp = is_f_tps(:one)
  end

  test "visiting the index" do
    visit is_f_tps_url
    assert_selector "h1", text: "Is F Tps"
  end

  test "creating a Is f tp" do
    visit is_f_tps_url
    click_on "New Is F Tp"

    fill_in "Isftp", with: @is_f_tp.isFTP
    click_on "Create Is f tp"

    assert_text "Is f tp was successfully created"
    click_on "Back"
  end

  test "updating a Is f tp" do
    visit is_f_tps_url
    click_on "Edit", match: :first

    fill_in "Isftp", with: @is_f_tp.isFTP
    click_on "Update Is f tp"

    assert_text "Is f tp was successfully updated"
    click_on "Back"
  end

  test "destroying a Is f tp" do
    visit is_f_tps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Is f tp was successfully destroyed"
  end
end
