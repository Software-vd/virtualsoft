require 'test_helper'

class TipodocsControllerTest < ActionController::TestCase
  setup do
    @tipodoc = tipodocs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipodocs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipodoc" do
    assert_difference('Tipodoc.count') do
      post :create, tipodoc: { Sigla: @tipodoc.Sigla, cliente_id: @tipodoc.cliente_id }
    end

    assert_redirected_to tipodoc_path(assigns(:tipodoc))
  end

  test "should show tipodoc" do
    get :show, id: @tipodoc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipodoc
    assert_response :success
  end

  test "should update tipodoc" do
    put :update, id: @tipodoc, tipodoc: { Sigla: @tipodoc.Sigla, cliente_id: @tipodoc.cliente_id }
    assert_redirected_to tipodoc_path(assigns(:tipodoc))
  end

  test "should destroy tipodoc" do
    assert_difference('Tipodoc.count', -1) do
      delete :destroy, id: @tipodoc
    end

    assert_redirected_to tipodocs_path
  end
end
