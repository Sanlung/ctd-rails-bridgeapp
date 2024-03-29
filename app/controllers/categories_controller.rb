class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found

  # GET /categories
  def index
    unless Current.user
      redirect_to welcome_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def catch_not_found(e)
    Rails.logger.debug('We had a not found exception')
    flash.alert = e.to_s
    redirect_to welcome_path
  end
end
