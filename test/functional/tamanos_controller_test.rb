require 'test_helper'

class TamanosControllerTest < ActionController::TestCase
  setup do
    @tamano = tamanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tamanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tamano" do
    assert_difference('Tamano.count') do
      post :create, tamano: { Sigla: @tamano.Sigla }
    end

    assert_redirected_to tamano_path(assigns(:tamano))
  end

  test "should show tamano" do
    get :show, id: @tamano
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tamano
    assert_response :success
  end

  test "should update tamano" do
    put :update, id: @tamano, tamano: { Sigla: @tamano.Sigla }
    assert_redirected_to tamano_path(assigns(:tamano))
  end

  test "should destroy tamano" do
    assert_difference('Tamano.count', -1) do
      delete :destroy, id: @tamano
    end

    assert_redirected_to tamanos_path
  end
end
