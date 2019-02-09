module QuestionsHelper
  def question_header(question)
    s = question.persisted? ? "Редактирование" : "Создание нового"
    s << " вопроса для теста \"#{question.test.title}\""
  end
end
