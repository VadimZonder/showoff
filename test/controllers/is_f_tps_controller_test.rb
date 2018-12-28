require 'test_helper'

class IsFTpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @is_f_tp = is_f_tps(:one)
  end

  test "should get index" do
    get is_f_tps_url
    assert_response :success
  end

  test "should get new" do
    get new_is_f_tp_url
    assert_response :success
  end

  test "should create is_f_tp" do
    assert_difference('IsFTp.count') do
      post is_f_tps_url, params: { is_f_tp: { isFTP: @is_f_tp.isFTP } }
    end

    assert_redirected_to is_f_tp_url(IsFTp.last)
  end

  test "should show is_f_tp" do
    get is_f_tp_url(@is_f_tp)
    assert_response :success
  end

  test "should get edit" do
    get edit_is_f_tp_url(@is_f_tp)
    assert_response :success
  end

  test "should update is_f_tp" do
    patch is_f_tp_url(@is_f_tp), params: { is_f_tp: { isFTP: @is_f_tp.isFTP } }
    assert_redirected_to is_f_tp_url(@is_f_tp)
  end

  test "should destroy is_f_tp" do
    assert_difference('IsFTp.count', -1) do
      delete is_f_tp_url(@is_f_tp)
    end

    assert_redirected_to is_f_tps_url
  end
end
