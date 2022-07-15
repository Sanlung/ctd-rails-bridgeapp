class WelcomeController < ApplicationController

  # GET welcome
  def index; end

  def new
    @user = User.new
  end

  # POST welcome
  def create
    if params[:commit] == 'Sign Up'
      @user = User.new(user_params)
      if @user.save
        # stores saved user id in a session
        session[:user_id] = @user.id
        flash.notice = "Success! You're logged in as #{@user.username}."
        redirect_to categories_path
      else
        flash.now.alert = 'Invalid information. Please try again.'
        render :index
      end
    elsif params[:commit] == 'Login'
      user = User.find_by(email: params[:email])
      # finds existing user, checks to see if user can be authenticated
      if user.present? && user.authenticate(params[:password])
        # sets up user.id sessions
        session[:user_id] = user.id
        flash.notice = "Success! You're logged in as #{user.username}."
        redirect_to categories_path
      else
        flash.now.alert = 'Invalid email or password. Please try again.'
        render :index
      end
    end
  end

  # DELETE welcome
  def destroy
    # deletes user session
    session[:user_id] = nil
    flash.notice = 'You\'re logged out.'
    redirect_to welcome_path
  end

  private

  def user_params
    # strong parameters
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
