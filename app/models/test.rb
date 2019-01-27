class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id", optional: true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  def self.find_by_category_name(category_name)
    joins(:category).where(categories: {title: category_name})
                    .order(title: :desc)
                    .pluck(:title)
  end
end
