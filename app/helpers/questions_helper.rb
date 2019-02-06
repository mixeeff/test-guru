module QuestionsHelper
  def question_header(new)
    s = new ? "Создание нового" : "Редактирование"
    s << " вопроса для теста \"#{@question.test.title}\""
  end
end
