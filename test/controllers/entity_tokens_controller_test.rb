require 'test_helper'

class EntityTokensControllerTest < ActionController::TestCase
  setup do
    @entity_token = entity_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entity_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entity_token" do
    assert_difference('EntityToken.count') do
      post :create, entity_token: {  }
    end

    assert_redirected_to entity_token_path(assigns(:entity_token))
  end

  test "should show entity_token" do
    get :show, id: @entity_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entity_token
    assert_response :success
  end

  test "should update entity_token" do
    patch :update, id: @entity_token, entity_token: {  }
    assert_redirected_to entity_token_path(assigns(:entity_token))
  end

  test "should destroy entity_token" do
    assert_difference('EntityToken.count', -1) do
      delete :destroy, id: @entity_token
    end

    assert_redirected_to entity_tokens_path
  end
end
