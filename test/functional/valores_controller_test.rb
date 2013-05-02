require 'test_helper'

class ValoresControllerTest < ActionController::TestCase
  setup do
    @valor = valores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valor" do
    assert_difference('Valor.count') do
      post :create, valor: { valor_total: @valor.valor_total, valor_unitario: @valor.valor_unitario }
    end

    assert_redirected_to valor_path(assigns(:valor))
  end

  test "should show valor" do
    get :show, id: @valor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valor
    assert_response :success
  end

  test "should update valor" do
    put :update, id: @valor, valor: { valor_total: @valor.valor_total, valor_unitario: @valor.valor_unitario }
    assert_redirected_to valor_path(assigns(:valor))
  end

  test "should destroy valor" do
    assert_difference('Valor.count', -1) do
      delete :destroy, id: @valor
    end

    assert_redirected_to valores_path
  end
end
