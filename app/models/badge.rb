class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :name, presence: true
  validates :rule_type, presence: true

  def achieved?(test_passage)
    # отбрасываем все заведомо не подходящие варианты
    return false if rule_type.nil?

    return false if rule_type == 'level' && test_passage.test.level != rule_value

    return false if rule_type == 'category' && test_passage.test.category_id != rule_value

    # если задано условие прохождения с первого раза
    if rule_type == 'pass'
      return TestPassage.where(test: test_passage.test, user: test_passage.user).count == 1
    end

    all_tests_count = Test.where("#{rule_type} = ?", rule_value).count #все тесты заданного уровня

    # получаем хэш с кол-вом прохождений каждого теста соотв. условию

    user_tests = TestPassage.joins(:test)
                            .where("user_id = ? AND tests.#{rule_type} = ?", test_passage.user_id, rule_value)
                            .passed
                            .group(:test_id)
                            .count
    if user_tests.size == all_tests_count
      passes = user_tests.values.min # минимально из всех количеств прохождений
    else
      return false
    end

    # смотрим сколько таких бэйджей уже есть
    badges_count = test_passage.user.users_badges.where(badge_id: id).count

    # если их меньше чем минимальное кол-во прохождений, даем еще один, т.е. возвращаем true
    # т.е. если пользователь прошел все тесты один раз
    # минимальное количество прохождений будет 1 даже если он какой-то тест прошел дважды
    passes > badges_count
  end

end
