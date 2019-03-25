class Feedback
  include ActiveModel::Model

  attr_accessor :email, :body, :id

  validates :email, :body, presence: true
end
