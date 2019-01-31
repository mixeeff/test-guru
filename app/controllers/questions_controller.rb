class QuestionsController < ApplicationController
  before_action :find_test
  rescue_from RuntimeError, with: :rescue_with_question_not_found

  def index
    question_list = @test.questions.pluck(:body)
    render plain: question_list.join("\n")
  end

  def show
    question_number = params[:id].to_i - 1
    raise RuntimeError if question_number >= @test.questions.count
    render plain: @test.questions[question_number].body
  end

  def new

  end

  def create
    question = Question.create!(question_params)
    redirect_to test_questions_path
  end

  def destroy
    question_number = params[:id].to_i - 1
    @test.questions[question_number].destroy
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
    #params.require(:test_id).permit(:test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Вопроса с таким номером в этом тесте нет"
  end
end
