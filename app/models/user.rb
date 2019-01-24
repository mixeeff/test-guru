class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :test_created, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
