require 'test_helper'

class PostcodesControllerTest < ActionController::TestCase
  setup do
    @postcode = postcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postcode" do
    assert_difference('Postcode.count') do
      post :create, :postcode => @postcode.attributes
    end

    assert_redirected_to postcode_path(assigns(:postcode))
  end

  test "should show postcode" do
    get :show, :id => @postcode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @postcode.to_param
    assert_response :success
  end

  test "should update postcode" do
    put :update, :id => @postcode.to_param, :postcode => @postcode.attributes
    assert_redirected_to postcode_path(assigns(:postcode))
  end

  test "should destroy postcode" do
    assert_difference('Postcode.count', -1) do
      delete :destroy, :id => @postcode.to_param
    end

    assert_redirected_to postcodes_path
  end
end
