require 'test_helper'

class QuasControllerTest < ActionController::TestCase
  setup do
    @qua = quas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qua" do
    assert_difference('Qua.count') do
      post :create, qua: { effect: @qua.effect, latitude: @qua.latitude, longitude: @qua.longitude, name: @qua.name, quality: @qua.quality, url: @qua.url }
    end

    assert_redirected_to qua_path(assigns(:qua))
  end

  test "should show qua" do
    get :show, id: @qua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qua
    assert_response :success
  end

  test "should update qua" do
    patch :update, id: @qua, qua: { effect: @qua.effect, latitude: @qua.latitude, longitude: @qua.longitude, name: @qua.name, quality: @qua.quality, url: @qua.url }
    assert_redirected_to qua_path(assigns(:qua))
  end

  test "should destroy qua" do
    assert_difference('Qua.count', -1) do
      delete :destroy, id: @qua
    end

    assert_redirected_to quas_path
  end
end
