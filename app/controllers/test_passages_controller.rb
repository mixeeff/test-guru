class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result fail gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.save_result
      TestsMailer.completed_test(@test_passage).deliver_now
      @badges = BadgeService.new(@test_passage, current_user).check_badges if @test_passage.successful?
      current_user.badges << @badges unless @badges.nil?
      #redirect_to result_test_passage_path(@test_passage)
      render :result
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      Gist.create!(question: @test_passage.current_question, url: result.html_url, user: @test_passage.user)
      flash_options = { flash: { success: t('.success_html', link: view_context.gist_link(result.html_url)) } }
    else
      flash_options = { flash: { error: t('.error') } }
    end

    redirect_to test_passage_path(@test_passage), flash_options
  end

  private
  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
