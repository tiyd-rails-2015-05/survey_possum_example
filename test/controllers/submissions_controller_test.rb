require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
    @answer = answers(:one)
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, submission: { survey_id: @submission.survey_id }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should create answers withsubmission" do
    assert_difference('Answer.count') do
      post :create, submission: { survey_id: @submission.survey_id,
          answers_attributes: [question_id: @question.id, response: @answer.response]}
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, id: @submission
    assert_response :success
  end


  # I don't think we want these capabilities, right? Once it's submitted, it's submitted.
  #
  # test "should get edit" do
  #   get :edit, id: @submission
  #   assert_response :success
  # end
  #
  # test "should update submission" do
  #   patch :update, id: @submission, submission: { survey_id: @submission.survey_id }
  #   assert_redirected_to submission_path(assigns(:submission))
  # end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission
    end

    assert_redirected_to submissions_path
  end
end
