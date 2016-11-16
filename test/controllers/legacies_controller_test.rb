require 'test_helper'

class LegaciesControllerTest < ActionController::TestCase
  setup do
    @legacy = legacies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:legacies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create legacy" do
    assert_difference('Legacy.count') do
      post :create, legacy: { age: @legacy.age, coverage_amount: @legacy.coverage_amount, insurance_years: @legacy.insurance_years, realationship_status: @legacy.realationship_status, smoker: @legacy.smoker, user_id: @legacy.user_id }
    end

    assert_redirected_to legacy_path(assigns(:legacy))
  end

  test "should show legacy" do
    get :show, id: @legacy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @legacy
    assert_response :success
  end

  test "should update legacy" do
    patch :update, id: @legacy, legacy: { age: @legacy.age, coverage_amount: @legacy.coverage_amount, insurance_years: @legacy.insurance_years, realationship_status: @legacy.realationship_status, smoker: @legacy.smoker, user_id: @legacy.user_id }
    assert_redirected_to legacy_path(assigns(:legacy))
  end

  test "should destroy legacy" do
    assert_difference('Legacy.count', -1) do
      delete :destroy, id: @legacy
    end

    assert_redirected_to legacies_path
  end
end
