require 'test_helper'

class TacosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get tacos" do
    get :index
    assert_response :success
    assert_select "h1", "Taco Quest"
  end

  test "valid tacos post" do
    post :find_tacos, taco_ids: [1,2], salsa_ids: [3,4], city_ids: [5,6]
    assert_response :success
    assert_select "h1", "Taco Results"
  end

  test "tacos post no tacos" do
    post :find_tacos, salsa_ids: [3,4], city_ids: [5,6]
    assert_response :redirect
  end

  test "tacos post no salsas" do
    post :find_tacos, taco_ids: [1,2], city_ids: [5,6]
    assert_response :redirect
  end

  test "tacos post no cities" do
    post :find_tacos, taco_ids: [1,2], salsa_ids: [3,4]
    assert_response :redirect
  end

  test "tacos post ids bigger than number of elements" do
    post :find_tacos, taco_ids: [100], salsa_ids: [3,4], city_ids: [5,6]
    assert_response :success
  end
end
