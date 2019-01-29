class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :one_to_four_answers_per_question

  def one_to_four_answers_per_question
    errors.add(:question_id, "Не более 4 вариантов ответов") if question.answers.count >= 4
  end
end
