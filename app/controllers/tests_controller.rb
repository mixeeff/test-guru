class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: Test.all.pluck(:title).join("\n")
  end

  def show
    test = Test.find(params[:id])
    render plain: test.title
  end

  def new; end

  def create
    test = Test.create!(test_params)
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: "Теста с таким номером нет"
  end
end
