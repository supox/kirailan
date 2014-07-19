require 'test_helper'

class HitchhikesControllerTest < ActionController::TestCase
  setup do
    @hitchhike = hitchhikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hitchhikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hitchhike" do
    assert_difference('Hitchhike.count') do
      post :create, hitchhike: { comments: @hitchhike.comments, from: @hitchhike.from, hour: @hitchhike.hour, name: @hitchhike.name, phone: @hitchhike.phone, taking: @hitchhike.taking }
    end

    assert_redirected_to hitchhike_path(assigns(:hitchhike))
  end

  test "should show hitchhike" do
    get :show, id: @hitchhike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hitchhike
    assert_response :success
  end

  test "should update hitchhike" do
    patch :update, id: @hitchhike, hitchhike: { comments: @hitchhike.comments, from: @hitchhike.from, hour: @hitchhike.hour, name: @hitchhike.name, phone: @hitchhike.phone, taking: @hitchhike.taking }
    assert_redirected_to hitchhike_path(assigns(:hitchhike))
  end

  test "should destroy hitchhike" do
    assert_difference('Hitchhike.count', -1) do
      delete :destroy, id: @hitchhike
    end

    assert_redirected_to hitchhikes_path
  end
end
