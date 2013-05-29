require 'test_helper'

class DespachosControllerTest < ActionController::TestCase
  setup do
    @despacho = despachos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:despachos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create despacho" do
    assert_difference('Despacho.count') do
      post :create, despacho: { Encargado: @despacho.Encargado, Fecha: @despacho.Fecha, estado_entrega_id: @despacho.estado_entrega_id, pagos_id: @despacho.pagos_id }
    end

    assert_redirected_to despacho_path(assigns(:despacho))
  end

  test "should show despacho" do
    get :show, id: @despacho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @despacho
    assert_response :success
  end

  test "should update despacho" do
    put :update, id: @despacho, despacho: { Encargado: @despacho.Encargado, Fecha: @despacho.Fecha, estado_entrega_id: @despacho.estado_entrega_id, pagos_id: @despacho.pagos_id }
    assert_redirected_to despacho_path(assigns(:despacho))
  end

  test "should destroy despacho" do
    assert_difference('Despacho.count', -1) do
      delete :destroy, id: @despacho
    end

    assert_redirected_to despachos_path
  end
end
