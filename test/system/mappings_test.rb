require "application_system_test_case"

class MappingsTest < ApplicationSystemTestCase
  setup do
    @mapping = mappings(:one)
  end

  test "visiting the index" do
    visit mappings_url
    assert_selector "h1", text: "Mappings"
  end

  test "creating a Mapping" do
    visit mappings_url
    click_on "New Mapping"

    fill_in "A1", with: @mapping.a1
    fill_in "Aa27", with: @mapping.aa27
    fill_in "Ad30", with: @mapping.ad30
    fill_in "Ae31", with: @mapping.ae31
    fill_in "Af32", with: @mapping.af32
    fill_in "B2", with: @mapping.b2
    fill_in "C3", with: @mapping.c3
    fill_in "D4", with: @mapping.d4
    fill_in "E5", with: @mapping.e5
    fill_in "F6", with: @mapping.f6
    fill_in "G7", with: @mapping.g7
    fill_in "H8", with: @mapping.h8
    fill_in "I9", with: @mapping.i9
    fill_in "J10", with: @mapping.j10
    fill_in "K11", with: @mapping.k11
    fill_in "L12", with: @mapping.l12
    fill_in "M13", with: @mapping.m13
    fill_in "N14", with: @mapping.n14
    fill_in "X24", with: @mapping.x24
    fill_in "Y25", with: @mapping.y25
    fill_in "Z26", with: @mapping.z26
    click_on "Create Mapping"

    assert_text "Mapping was successfully created"
    click_on "Back"
  end

  test "updating a Mapping" do
    visit mappings_url
    click_on "Edit", match: :first

    fill_in "A1", with: @mapping.a1
    fill_in "Aa27", with: @mapping.aa27
    fill_in "Ad30", with: @mapping.ad30
    fill_in "Ae31", with: @mapping.ae31
    fill_in "Af32", with: @mapping.af32
    fill_in "B2", with: @mapping.b2
    fill_in "C3", with: @mapping.c3
    fill_in "D4", with: @mapping.d4
    fill_in "E5", with: @mapping.e5
    fill_in "F6", with: @mapping.f6
    fill_in "G7", with: @mapping.g7
    fill_in "H8", with: @mapping.h8
    fill_in "I9", with: @mapping.i9
    fill_in "J10", with: @mapping.j10
    fill_in "K11", with: @mapping.k11
    fill_in "L12", with: @mapping.l12
    fill_in "M13", with: @mapping.m13
    fill_in "N14", with: @mapping.n14
    fill_in "X24", with: @mapping.x24
    fill_in "Y25", with: @mapping.y25
    fill_in "Z26", with: @mapping.z26
    click_on "Update Mapping"

    assert_text "Mapping was successfully updated"
    click_on "Back"
  end

  test "destroying a Mapping" do
    visit mappings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mapping was successfully destroyed"
  end
end
