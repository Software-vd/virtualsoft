require 'test_helper'

class EstadoentregasControllerTest < ActionController::TestCase
  setup do
    @estadoentrega = estadoentregas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estadoentregas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estadoentrega" do
    assert_difference('Estadoentrega.count') do
      post :create, estadoentrega: { Descripcion: @estadoentrega.Descripcion }
    end

    assert_redirected_to estadoentrega_path(assigns(:estadoentrega))
  end

  test "should show estadoentrega" do
    get :show, id: @estadoentrega
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estadoentrega
    assert_response :success
  end

  test "should update estadoentrega" do
    put :update, id: @estadoentrega, estadoentrega: { Descripcion: @estadoentrega.Descripcion }
    assert_redirected_to estadoentrega_path(assigns(:estadoentrega))
  end

  test "should destroy estadoentrega" do
    assert_difference('Estadoentrega.count', -1) do
      delete :destroy, id: @estadoentrega
    end

    assert_redirected_to estadoentregas_path
  end
end
