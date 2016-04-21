require 'test_helper'

class ResumeDataControllerTest < ActionController::TestCase
  setup do
    @resume_datum = resume_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resume_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resume_datum" do
    assert_difference('ResumeDatum.count') do
      post :create, resume_datum: { email: @resume_datum.email, name: @resume_datum.name, phone: @resume_datum.phone, summary: @resume_datum.summary }
    end

    assert_redirected_to resume_datum_path(assigns(:resume_datum))
  end

  test "should show resume_datum" do
    get :show, id: @resume_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resume_datum
    assert_response :success
  end

  test "should update resume_datum" do
    patch :update, id: @resume_datum, resume_datum: { email: @resume_datum.email, name: @resume_datum.name, phone: @resume_datum.phone, summary: @resume_datum.summary }
    assert_redirected_to resume_datum_path(assigns(:resume_datum))
  end

  test "should destroy resume_datum" do
    assert_difference('ResumeDatum.count', -1) do
      delete :destroy, id: @resume_datum
    end

    assert_redirected_to resume_data_path
  end
end
