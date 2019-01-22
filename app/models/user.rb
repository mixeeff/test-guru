class User < ApplicationRecord
  has_many :passed_tests
  def passed_tests_by_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id')
        .where(level: level, passed_tests: {user_id: id})
  end
end
