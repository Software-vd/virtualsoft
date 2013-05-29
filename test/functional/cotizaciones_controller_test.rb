require 'test_helper'

class CotizacionesControllerTest < ActionController::TestCase
  setup do
    @cotizacion = cotizaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cotizaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cotizacion" do
    assert_difference('Cotizacion.count') do
      post :create, cotizacion: { Apellidos: @cotizacion.Apellidos, Fecha: @cotizacion.Fecha, Nombres: @cotizacion.Nombres, Numero_cotizacion: @cotizacion.Numero_cotizacion, Numero_documento: @cotizacion.Numero_documento, Tipodoc_id: @cotizacion.Tipodoc_id, producto_id: @cotizacion.producto_id, valor_id: @cotizacion.valor_id }
    end

    assert_redirected_to cotizacion_path(assigns(:cotizacion))
  end

  test "should show cotizacion" do
    get :show, id: @cotizacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cotizacion
    assert_response :success
  end

  test "should update cotizacion" do
    put :update, id: @cotizacion, cotizacion: { Apellidos: @cotizacion.Apellidos, Fecha: @cotizacion.Fecha, Nombres: @cotizacion.Nombres, Numero_cotizacion: @cotizacion.Numero_cotizacion, Numero_documento: @cotizacion.Numero_documento, Tipodoc_id: @cotizacion.Tipodoc_id, producto_id: @cotizacion.producto_id, valor_id: @cotizacion.valor_id }
    assert_redirected_to cotizacion_path(assigns(:cotizacion))
  end

  test "should destroy cotizacion" do
    assert_difference('Cotizacion.count', -1) do
      delete :destroy, id: @cotizacion
    end

    assert_redirected_to cotizaciones_path
  end
end
