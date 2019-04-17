class BadgeService
  def initialize(test_passage, user)
    @test_passage = test_passage
    @user = user
  end

  def check_badges
    @all_badges = Badge.all
    @badges = []
    @all_badges.each do |badge|
      if badge_achieved?(badge)
        @user.badges.push(badge)
        @badges.push(badge)
      end
    end
    @badges
  end

  def badge_achieved?(badge)
    send("#{badge.rule_type}_check".to_sym, badge)
  end

  def level_check(badge)
    return false if @test_passage.test.level != badge.rule_value
    count_user_badges(@user, badge) < count_success_passes(@user, badge)
  end

  def category_id_check(badge)
    return false if @test_passage.test.category_id != badge.rule_value
    count_user_badges(@user, badge) < count_success_passes(@user, badge)
  end

  def first_pass_check(badge)
    TestPassage.where(test: @test_passage.test, user: @user).count == 1
  end

  private

  def count_success_passes(user, badge)
    user_tests = count_user_tests(user, badge)
    if user_tests.size == all_tests_count(badge)
      user_tests.values.min # возвращаем минимальное из всех количеств прохождений
    else
      0
    end
  end

  def count_user_tests(user, badge)
    # возвращает хэш с кол-вом прохождений каждого теста соотв. условию
    TestPassage.joins(:test).where("user_id = ? AND tests.#{badge.rule_type} = ?", user, badge.rule_value)
                            .passed
                            .group(:test_id)
                            .count
  end

  def all_tests_count(badge)
    #кол-во всех тестов заданного условия
    Test.where("#{badge.rule_type} = ?", badge.rule_value).count
  end

  def count_user_badges(user, badge)
    #есть ли такие бэйджи у пользователя
    user.badges.where(id: badge.id).count
  end

end
