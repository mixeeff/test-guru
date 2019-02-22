require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :test_created, class_name: "Test", foreign_key: "author_id", dependent: :nullify

  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end


end
