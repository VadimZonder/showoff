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
      post mappings_url, params: { mapping: { a1: @mapping.a1, aa27: @mapping.aa27, ad30: @mapping.ad30, ae31: @mapping.ae31, af32: @mapping.af32, b2: @mapping.b2, c3: @mapping.c3, d4: @mapping.d4, e5: @mapping.e5, f6: @mapping.f6, g7: @mapping.g7, h8: @mapping.h8, i9: @mapping.i9, j10: @mapping.j10, k11: @mapping.k11, l12: @mapping.l12, m13: @mapping.m13, n14: @mapping.n14, x24: @mapping.x24, y25: @mapping.y25, z26: @mapping.z26 } }
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
    patch mapping_url(@mapping), params: { mapping: { a1: @mapping.a1, aa27: @mapping.aa27, ad30: @mapping.ad30, ae31: @mapping.ae31, af32: @mapping.af32, b2: @mapping.b2, c3: @mapping.c3, d4: @mapping.d4, e5: @mapping.e5, f6: @mapping.f6, g7: @mapping.g7, h8: @mapping.h8, i9: @mapping.i9, j10: @mapping.j10, k11: @mapping.k11, l12: @mapping.l12, m13: @mapping.m13, n14: @mapping.n14, x24: @mapping.x24, y25: @mapping.y25, z26: @mapping.z26 } }
    assert_redirected_to mapping_url(@mapping)
  end

  test "should destroy mapping" do
    assert_difference('Mapping.count', -1) do
      delete mapping_url(@mapping)
    end

    assert_redirected_to mappings_url
  end
end
