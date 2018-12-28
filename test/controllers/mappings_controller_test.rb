require 'test_helper'

class MappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mapping = mappings(:one)
  end

  test "should get index" do
    get mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_mapping_url
    assert_response :success
  end

  test "should create mapping" do
    assert_difference('Mapping.count') do
      post mappings_url, params: { mapping: { a1: @mapping.a1, aa27: @mapping.aa27, ab28: @mapping.ab28, ac29: @mapping.ac29, ad30: @mapping.ad30, ae31: @mapping.ae31, af32: @mapping.af32, ag33: @mapping.ag33, ah34: @mapping.ah34, ai35: @mapping.ai35, aj36: @mapping.aj36, ak37: @mapping.ak37, al38: @mapping.al38, am39: @mapping.am39, an40: @mapping.an40, ao41: @mapping.ao41, ap42: @mapping.ap42, aq43: @mapping.aq43, ar44: @mapping.ar44, as45: @mapping.as45, at46: @mapping.at46, au47: @mapping.au47, av48: @mapping.av48, aw49: @mapping.aw49, ax50: @mapping.ax50, b2: @mapping.b2, c3: @mapping.c3, d4: @mapping.d4, e5: @mapping.e5, f6: @mapping.f6, g7: @mapping.g7, h8: @mapping.h8, i9: @mapping.i9, j10: @mapping.j10, k11: @mapping.k11, l12: @mapping.l12, m13: @mapping.m13, n14: @mapping.n14, o15: @mapping.o15, p16: @mapping.p16, q17: @mapping.q17, r18: @mapping.r18, s19: @mapping.s19, t20: @mapping.t20, u21: @mapping.u21, v22: @mapping.v22, w23: @mapping.w23, x24: @mapping.x24, y25: @mapping.y25, z26: @mapping.z26 } }
    end

    assert_redirected_to mapping_url(Mapping.last)
  end

  test "should show mapping" do
    get mapping_url(@mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_mapping_url(@mapping)
    assert_response :success
  end

  test "should update mapping" do
    patch mapping_url(@mapping), params: { mapping: { a1: @mapping.a1, aa27: @mapping.aa27, ab28: @mapping.ab28, ac29: @mapping.ac29, ad30: @mapping.ad30, ae31: @mapping.ae31, af32: @mapping.af32, ag33: @mapping.ag33, ah34: @mapping.ah34, ai35: @mapping.ai35, aj36: @mapping.aj36, ak37: @mapping.ak37, al38: @mapping.al38, am39: @mapping.am39, an40: @mapping.an40, ao41: @mapping.ao41, ap42: @mapping.ap42, aq43: @mapping.aq43, ar44: @mapping.ar44, as45: @mapping.as45, at46: @mapping.at46, au47: @mapping.au47, av48: @mapping.av48, aw49: @mapping.aw49, ax50: @mapping.ax50, b2: @mapping.b2, c3: @mapping.c3, d4: @mapping.d4, e5: @mapping.e5, f6: @mapping.f6, g7: @mapping.g7, h8: @mapping.h8, i9: @mapping.i9, j10: @mapping.j10, k11: @mapping.k11, l12: @mapping.l12, m13: @mapping.m13, n14: @mapping.n14, o15: @mapping.o15, p16: @mapping.p16, q17: @mapping.q17, r18: @mapping.r18, s19: @mapping.s19, t20: @mapping.t20, u21: @mapping.u21, v22: @mapping.v22, w23: @mapping.w23, x24: @mapping.x24, y25: @mapping.y25, z26: @mapping.z26 } }
    assert_redirected_to mapping_url(@mapping)
  end

  test "should destroy mapping" do
    assert_difference('Mapping.count', -1) do
      delete mapping_url(@mapping)
    end

    assert_redirected_to mappings_url
  end
end
