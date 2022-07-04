class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers

  validates :content, presence: true
  validates_associated :answers
end
