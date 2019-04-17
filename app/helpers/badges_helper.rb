module BadgesHelper
  def available_levels
    Test.select(:level).distinct.pluck(:level)
  end

  def available_categories
    Category.all.pluck(:title, :id)
  end
end
