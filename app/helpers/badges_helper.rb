module BadgesHelper
  def available_levels
    Test.select(:level).distinct.pluck(:level)
  end

  def available_categories
    Category.all.pluck(:title, :id)
  end

  def local_rule_types
    Badge::RULE_TYPES.map{ |rule_type| [t(".#{rule_type}"), rule_type]}
  end
end
