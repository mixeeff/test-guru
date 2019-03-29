module TestPassageHelper
  def set_end_time(test_passage)
    end_time = test_passage.created_at.to_i
    end_time += test_passage.test.timer * 60
  end
end
