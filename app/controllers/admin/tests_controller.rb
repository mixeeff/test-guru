class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, flash: { success: t('.deleted') }
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: t('.test_not_found')
  end
end
