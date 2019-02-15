class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def successful?
    test_result >= 85
  end

  def test_result
    (correct_questions / test.questions.count.to_f * 100).round
  end

  def current_question_num
    test.questions.order(:id).ids.index(current_question.id) + 1
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    return correct_answers.count == 0 if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

end
