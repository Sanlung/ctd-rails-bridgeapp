class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :content, :user, :question, presence: true
end
