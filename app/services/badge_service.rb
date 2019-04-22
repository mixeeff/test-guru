class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def check_badges
    @badges = Badge.all.select { |badge| badge_achieved?(badge) }
  end

  def badge_achieved?(badge)
    send("#{badge.rule_type}_check".to_sym, badge)
  end

  def level_check(badge)
    return false unless @test_passage.successful?
    return false if @test.level != badge.rule_value
    check_badge(badge)
  end

  def category_id_check(badge)
    return false unless @test_passage.successful?
    return false if @test.category_id != badge.rule_value
    check_badge(badge)
  end

  def first_pass_check(_badge)
    return false unless @test_passage.successful?
    @user.test_passages.where(test: @test).count == 1
  end

  private

  def check_badge(badge)
    user_tests = count_user_tests(badge) # получаем хэш с кол-вом прохождений каждого теста соотв. условию
    user_tests.size == all_tests_count(badge) &&  # число записей в хэше д.б. равно общему кол-ву тестов соотв. условию
      user_tests.values.min > count_user_badges(badge)  # если минимальное кол-во прохождений больше чем кол-во бэйджей - выдаем бэйдж
  end

  def count_user_tests(badge)
    # возвращает хэш с кол-вом прохождений каждого теста соотв. условию
    @user.test_passages.joins(:test).where("tests.#{badge.rule_type} = ?", badge.rule_value)
      .passed
      .group(:test)
      .count
  end

  def all_tests_count(badge)
    #кол-во всех тестов заданного условия
    Test.where("#{badge.rule_type} = ?", badge.rule_value).count
  end

  def count_user_badges(badge)
    #есть ли такие бэйджи у пользователя
    @user.badges.where(id: badge.id).count
  end

end
