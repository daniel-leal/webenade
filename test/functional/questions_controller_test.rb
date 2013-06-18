require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { alternativa_a: @question.alternativa_a, alternativa_b: @question.alternativa_b, alternativa_c: @question.alternativa_c, alternativa_correta: @question.alternativa_correta, alternativa_d: @question.alternativa_d, alternativa_e: @question.alternativa_e, assunto: @question.assunto, enunciado: @question.enunciado, tags: @question.tags }
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, question: { alternativa_a: @question.alternativa_a, alternativa_b: @question.alternativa_b, alternativa_c: @question.alternativa_c, alternativa_correta: @question.alternativa_correta, alternativa_d: @question.alternativa_d, alternativa_e: @question.alternativa_e, assunto: @question.assunto, enunciado: @question.enunciado, tags: @question.tags }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
