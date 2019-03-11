class GistQuestionService
  class ResultObject
    def initialize(response = nil)
      @response = response
    end

    def html_url
      @response&.html_url
    end

    def success?
      html_url.present?
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response)
  rescue OctokitError
    ResultObject.new
  end

  private
  def gist_params
    {
      description: I18n.t('gist_question_service.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
