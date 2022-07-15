require 'rails_helper'

RSpec.describe 'WelcomeControllers', type: :request do
  user_attributes = FactoryBot.attributes_for(:user)
  describe 'get welcome_path' do
    it 'renders the index view' do
      get welcome_path
      expect(response).to render_template(:index)
    end
  end

  describe 'get new_welcome_path' do
    it 'renders the new view' do
      get new_welcome_path
      expect(response).to render_template(:new)
    end
  end

  describe 'post user sign up with valid data' do
    it 'registers a new user and redirects to the categories_path' do
      expect { post welcome_path, params: { commit: 'Sign Up', user: user_attributes } }.to change(User, :count)
      expect(response).to redirect_to categories_path
    end
  end

  describe 'post user sign up with invalid data' do
    it 'does not register the new user or redirects to the categories_path' do
      user_attributes.delete(:email)
      expect { post welcome_path, params: { commit: 'Sign Up', user: user_attributes } }.to_not change(User, :count)
      expect(response).to render_template(:index)
    end
  end

  describe 'post user login with valid data' do
    it 'logs in a user and redirects to the categories_path' do
      post welcome_path, params: { commit: 'Login', user: user_attributes }
      expect(response).to redirect_to categories_path
    end
  end
end
