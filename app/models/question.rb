class Question < ApplicationRecord
  belongs_to :category
  has_many :answers, dependent: :destroy

  validates :content, presence: true
  validates_associated :answers
end