class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :test_created, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def passed_tests_by_level(level)
    tests.by_level(level)
  end
end
