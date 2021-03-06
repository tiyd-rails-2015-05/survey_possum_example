require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
    session[:author_id] = @author.id
  end

  #Authors index feels like an admin privilege to me...
  test "should NOT get index" do
    get :index
    assert_redirected_to root_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    session[:author_id] = nil
    assert_difference('Author.count') do
      post :create, author: { email: Faker::Internet.email, first_name: @author.first_name,
          last_name: @author.last_name, password: "password", password_confirmation: "password" }
    end

    assert_redirected_to root_path
  end

  test "should require unique email" do
    post :create, author: { email: @author.email, first_name: @author.first_name,
        last_name: @author.last_name, password: "password", password_confirmation: "password" }

    assert response.body.match "error"
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should update author" do
    patch :update, id: @author, author: { email: Faker::Internet.email, first_name: @author.first_name, last_name: @author.last_name, password_digest: "password" }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end
end
