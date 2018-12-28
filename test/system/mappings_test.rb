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
    fill_in "Ab28", with: @mapping.ab28
    fill_in "Ac29", with: @mapping.ac29
    fill_in "Ad30", with: @mapping.ad30
    fill_in "Ae31", with: @mapping.ae31
    fill_in "Af32", with: @mapping.af32
    fill_in "Ag33", with: @mapping.ag33
    fill_in "Ah34", with: @mapping.ah34
    fill_in "Ai35", with: @mapping.ai35
    fill_in "Aj36", with: @mapping.aj36
    fill_in "Ak37", with: @mapping.ak37
    fill_in "Al38", with: @mapping.al38
    fill_in "Am39", with: @mapping.am39
    fill_in "An40", with: @mapping.an40
    fill_in "Ao41", with: @mapping.ao41
    fill_in "Ap42", with: @mapping.ap42
    fill_in "Aq43", with: @mapping.aq43
    fill_in "Ar44", with: @mapping.ar44
    fill_in "As45", with: @mapping.as45
    fill_in "At46", with: @mapping.at46
    fill_in "Au47", with: @mapping.au47
    fill_in "Av48", with: @mapping.av48
    fill_in "Aw49", with: @mapping.aw49
    fill_in "Ax50", with: @mapping.ax50
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
    fill_in "O15", with: @mapping.o15
    fill_in "P16", with: @mapping.p16
    fill_in "Q17", with: @mapping.q17
    fill_in "R18", with: @mapping.r18
    fill_in "S19", with: @mapping.s19
    fill_in "T20", with: @mapping.t20
    fill_in "U21", with: @mapping.u21
    fill_in "V22", with: @mapping.v22
    fill_in "W23", with: @mapping.w23
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
    fill_in "Ab28", with: @mapping.ab28
    fill_in "Ac29", with: @mapping.ac29
    fill_in "Ad30", with: @mapping.ad30
    fill_in "Ae31", with: @mapping.ae31
    fill_in "Af32", with: @mapping.af32
    fill_in "Ag33", with: @mapping.ag33
    fill_in "Ah34", with: @mapping.ah34
    fill_in "Ai35", with: @mapping.ai35
    fill_in "Aj36", with: @mapping.aj36
    fill_in "Ak37", with: @mapping.ak37
    fill_in "Al38", with: @mapping.al38
    fill_in "Am39", with: @mapping.am39
    fill_in "An40", with: @mapping.an40
    fill_in "Ao41", with: @mapping.ao41
    fill_in "Ap42", with: @mapping.ap42
    fill_in "Aq43", with: @mapping.aq43
    fill_in "Ar44", with: @mapping.ar44
    fill_in "As45", with: @mapping.as45
    fill_in "At46", with: @mapping.at46
    fill_in "Au47", with: @mapping.au47
    fill_in "Av48", with: @mapping.av48
    fill_in "Aw49", with: @mapping.aw49
    fill_in "Ax50", with: @mapping.ax50
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
    fill_in "O15", with: @mapping.o15
    fill_in "P16", with: @mapping.p16
    fill_in "Q17", with: @mapping.q17
    fill_in "R18", with: @mapping.r18
    fill_in "S19", with: @mapping.s19
    fill_in "T20", with: @mapping.t20
    fill_in "U21", with: @mapping.u21
    fill_in "V22", with: @mapping.v22
    fill_in "W23", with: @mapping.w23
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
