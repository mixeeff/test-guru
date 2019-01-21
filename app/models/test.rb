class Test < ApplicationRecord
  has_many :questions
  has_many :passed_tests
  belongs_to :category
  def self.find_by_category_name(category_name)
    Test.joins(:category).where(categories: {title: category_name}).order(title: :desc).pluck(:title)
  end
end
