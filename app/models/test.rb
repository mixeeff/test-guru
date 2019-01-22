class Test < ApplicationRecord
  has_many :questions
  has_many :passed_tests
  belongs_to :category
  def self.find_by_category_name(category_name)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: {title: category_name})
      .order(title: :desc)
      .pluck(:title)
  end
end
