require 'test_helper'

class Admin::PostResourcesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_resource" do
    assert_difference('PostResource.count') do
      post :create, :post_resource => { }
    end

    assert_redirected_to admin_post_resource_path(assigns(:post_resource))
  end

  test "should show post_resource" do
    get :show, :id => post_resources(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => post_resources(:one).to_param
    assert_response :success
  end

  test "should update post_resource" do
    put :update, :id => post_resources(:one).to_param, :post_resource => { }
    assert_redirected_to admin_post_resource_path(assigns(:post_resource))
  end

  test "should destroy post_resource" do
    assert_difference('PostResource.count', -1) do
      delete :destroy, :id => post_resources(:one).to_param
    end

    assert_redirected_to admin_post_resources_path
  end
end
