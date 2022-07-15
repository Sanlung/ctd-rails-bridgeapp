class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :answers

  validates :content, :user, :category, presence: true
  validates :content, uniqueness: true
  validates_associated :answers
end
