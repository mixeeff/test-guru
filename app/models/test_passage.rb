class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  attr_accessor :time_failed

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

  def save_result
    if timer_valid?
      self.test_result = (correct_questions / test.questions.count.to_f * 100).round
    else
      self.test_result = 0
      self.correct_questions = 0
      self.time_failed = true
    end
    save!
  end

  def current_question_num
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def test_end_time
    end_time = created_at.to_i
    end_time += test.timer# * 60
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
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

  def timer_valid?
    return true if test.timer.nil?
    Time.now.to_i < test_end_time
  end

end
