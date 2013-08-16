require 'test_helper'

class CotizaciondetallesControllerTest < ActionController::TestCase
  setup do
    @cotizaciondetalle = cotizaciondetalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cotizaciondetalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cotizaciondetalle" do
    assert_difference('Cotizaciondetalle.count') do
      post :create, cotizaciondetalle: { cantidad: @cotizaciondetalle.cantidad, producto_id: @cotizaciondetalle.producto_id, subtotal: @cotizaciondetalle.subtotal }
    end

    assert_redirected_to cotizaciondetalle_path(assigns(:cotizaciondetalle))
  end

  test "should show cotizaciondetalle" do
    get :show, id: @cotizaciondetalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cotizaciondetalle
    assert_response :success
  end

  test "should update cotizaciondetalle" do
    put :update, id: @cotizaciondetalle, cotizaciondetalle: { cantidad: @cotizaciondetalle.cantidad, producto_id: @cotizaciondetalle.producto_id, subtotal: @cotizaciondetalle.subtotal }
    assert_redirected_to cotizaciondetalle_path(assigns(:cotizaciondetalle))
  end

  test "should destroy cotizaciondetalle" do
    assert_difference('Cotizaciondetalle.count', -1) do
      delete :destroy, id: @cotizaciondetalle
    end

    assert_redirected_to cotizaciondetalles_path
  end
end
