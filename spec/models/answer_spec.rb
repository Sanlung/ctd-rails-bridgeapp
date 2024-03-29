require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject {
    Answer.new(
      content: 'I want to answer a question.',
      question: Question.new(content: 'I want to ask a question.'),
      user: User.new(
        username: 'superhero123',
        email: 'superhero123@super.com',
        password: '321orehrepus'
      )
    )
  }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if no question is associated' do
    subject.question = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if no user is associated' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
