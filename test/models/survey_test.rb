require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  test "knows which questions are required" do
    @survey = surveys(:one)
    @survey_two = surveys(:two)
    @question = questions(:three)
    @question_four = questions(:four)

    assert_equal [@question, @question_four], @survey.required_questions
    assert_equal [], @survey_two.required_questions
  end
end
