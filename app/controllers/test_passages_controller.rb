class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_data = GistQuestionService.new(@test_passage.current_question).call
    if gist_data.nil?
      flash_options = { flash: { error: t('.error') } }
    else
      @gist = Gist.new
      @gist.question = @test_passage.current_question
      @gist.user = current_user
      @gist.url = gist_data[:id]
      flash_options = { flash: { success: t('.success_html', link: view_context.gist_link(@gist.url)) } }
      @gist.save
    end
    redirect_to test_passage_path(@test_passage), flash_options
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
