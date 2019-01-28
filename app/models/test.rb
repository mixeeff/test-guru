class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id", optional: true
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  scope :easy, -> { where(level: TestGuru::EASY_LEVEL) }
  scope :medium, -> { where(level: TestGuru::MEDIUM_LEVEL) }
  scope :hard, -> { where(level: TestGuru::HARD_LEVEL) }
  scope :by_level, -> (level) { where(level: level) }

  scope :find_by_category_name, ->(category_name) {
    joins(:category).where(categories: { title: category_name })
                    .order(title: :desc)
  }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  def self.titles_by_category_name(category_name)
    find_by_category_name(category_name).pluck(:title)
  end
end
