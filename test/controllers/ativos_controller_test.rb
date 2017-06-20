require 'test_helper'

class AtivosControllerTest < ActionController::TestCase
  setup do
    @ativo = ativos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ativos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ativo" do
    assert_difference('Ativo.count') do
      post :create, ativo: { curto_prazo: @ativo.curto_prazo, imobilizado: @ativo.imobilizado, intangivel: @ativo.intangivel, investimento: @ativo.investimento, longo_prazo: @ativo.longo_prazo, name: @ativo.name, natureza_conta: @ativo.natureza_conta }
    end

    assert_redirected_to ativo_path(assigns(:ativo))
  end

  test "should show ativo" do
    get :show, id: @ativo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ativo
    assert_response :success
  end

  test "should update ativo" do
    patch :update, id: @ativo, ativo: { curto_prazo: @ativo.curto_prazo, imobilizado: @ativo.imobilizado, intangivel: @ativo.intangivel, investimento: @ativo.investimento, longo_prazo: @ativo.longo_prazo, name: @ativo.name, natureza_conta: @ativo.natureza_conta }
    assert_redirected_to ativo_path(assigns(:ativo))
  end

  test "should destroy ativo" do
    assert_difference('Ativo.count', -1) do
      delete :destroy, id: @ativo
    end

    assert_redirected_to ativos_path
  end
end
