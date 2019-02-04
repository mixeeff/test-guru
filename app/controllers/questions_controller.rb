class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    question = Question.new(question_params)
    question.test_id = params[:test_id]
    question.save!
    redirect_to test_questions_path
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
    #params.require(:test_id).permit(:test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Вопроса с таким номером нет"
  end
end
