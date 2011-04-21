require 'test_helper'

class StatementsControllerTest < ActionController::TestCase
  setup do
    @statement = statements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statement" do
    assert_difference('Statement.count') do
      post :create, :statement => @statement.attributes
    end

    assert_redirected_to statement_path(assigns(:statement))
  end

  test "should show statement" do
    get :show, :id => @statement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @statement.to_param
    assert_response :success
  end

  test "should update statement" do
    put :update, :id => @statement.to_param, :statement => @statement.attributes
    assert_redirected_to statement_path(assigns(:statement))
  end

  test "should destroy statement" do
    assert_difference('Statement.count', -1) do
      delete :destroy, :id => @statement.to_param
    end

    assert_redirected_to statements_path
  end
end
