class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    false
  end
end
