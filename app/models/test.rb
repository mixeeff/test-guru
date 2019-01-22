class Test < ApplicationRecord
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id", optional: true
  has_many :tests_users
  has_many :users, through: :tests_users

  # def self.find_by_category_name(category_name)
  #   joins('JOIN categories ON categories.id = tests.category_id')
  #     .where(categories: {title: category_name})
  #     .order(title: :desc)
  #     .pluck(:title)
  # end
end
