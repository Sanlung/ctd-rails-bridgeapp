require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    User.new(
      username: 'superhero123',
      email: 'superhero123@super.com',
      password: '321orehrepus'
    )
  }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the username is less than 5 characters' do
    subject.username = 'hero'
    expect(subject).to_not be_valid
  end
  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the email doesn\'t have a @' do
    subject.email = 'superhero123super.com'
    expect(subject).to_not be_valid
  end
  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid if the password is less than 8 cahracters' do
    subject.password = '321oreh'
    expect(subject).to_not be_valid
  end
end
