require 'test_helper'

class ItemimagesControllerTest < ActionController::TestCase
  setup do
    @itemimage = itemimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itemimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itemimage" do
    assert_difference('Itemimage.count') do
      post :create, itemimage: { image: @itemimage.image, item_id: @itemimage.item_id, position: @itemimage.position }
    end

    assert_redirected_to itemimage_path(assigns(:itemimage))
  end

  test "should show itemimage" do
    get :show, id: @itemimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itemimage
    assert_response :success
  end

  test "should update itemimage" do
    patch :update, id: @itemimage, itemimage: { image: @itemimage.image, item_id: @itemimage.item_id, position: @itemimage.position }
    assert_redirected_to itemimage_path(assigns(:itemimage))
  end

  test "should destroy itemimage" do
    assert_difference('Itemimage.count', -1) do
      delete :destroy, id: @itemimage
    end

    assert_redirected_to itemimages_path
  end
end
