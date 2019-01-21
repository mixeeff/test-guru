class User < ApplicationRecord
  has_many :passed_tests
  def passed_tests_by_level(level)
    Test.where(level: level).joins(:passed_tests).where(passed_tests: {user_id: self.id})
  end
end
