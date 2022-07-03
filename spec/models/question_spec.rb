require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { Question.new(
    content: 'I want to ask a question.',
    category: Category.new(title: 'Pre-commitment')
    )}
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if no category is associated' do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end
