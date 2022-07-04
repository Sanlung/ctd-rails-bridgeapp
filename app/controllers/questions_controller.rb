class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_category
  before_action :set_questions

  # GET /catoegories/1/questions
  def index; end

  # GET /categories/1/questions/new
  def new
    @question = Question.new
  end

  # POST /categories/1/questions
  def create
    @user = Current.user
    @question = Question.new(question_params)
    if @question.save
      flash.notice = 'The question was created successfully.'
      redirect_to @questions
    else
      flash.now.alert = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_questions
    prim_keys = []
    Questions.find_each do |q|
      prim_keys << q.id if q.category_id == @category.id
    end
    @questions = Question.find(prim_keys)
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:content, :category_id, :user_id)
  end

  def catch_not_found(e)
    Rails.logger.debug('We had a not found exception')
    flash.alert = e.to_s
    redirect_to orders_path
  end
end
