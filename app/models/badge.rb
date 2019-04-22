class Badge < ApplicationRecord
  RULE_TYPES = ['level', 'category_id', 'first_pass'].freeze

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :name, presence: true
  validates :filename, presence: true
  validates :rule_type, presence: true, inclusion: { in: RULE_TYPES }
end
