class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :test_created, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true

  def passed_tests_by_level(level)
    tests.by_level(level)
  end
end
