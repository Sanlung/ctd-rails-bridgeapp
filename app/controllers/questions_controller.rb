class QuestionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_category, :require_login
  before_action :set_questions, only: %i[index new create update]
  before_action :set_question, only: %i[show edit update]

  # GET /catoegories/1/questions
  def index; end

  # GET /categories/1/questions/new
  def new
    @question = Question.new
  end

  # GET /categories/1/questions/1
  def show; end

  # GET /categories/1/questions/1/edit
  def edit; end

  # POST /categories/1/questions
  def create
    @question = Question.new(question_params)
    if @question.save
      flash.notice = "Question successfully created by #{Current.user.username}."
      redirect_to new_category_question_path(question_params[:category_id])
    else
      flash.now.alert = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  # PUT/PATCH /categories/1/questions/1
  def update
    if @question.user_id.to_s != question_params[:user_id]
      flash.now.alert = "You're not permitted to edit other's questions"
      render :new
    elsif @question.update(question_params)
      @question.update(question_params)
      flash.notice = "Question successfully edited by #{Current.user.username}"
      redirect_to new_category_question_path(question_params[:category_id])
    else
      flash.now.alert = @question.errors.full_messages.to_sentence
      render :edit
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questions
    prim_keys = []
    Question.find_each do |q|
      prim_keys << q.id if q.category_id == @category.id
    end
    @questions = Question.find(prim_keys)
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:content, :category_id, :user_id)
  end

  # require Login
  def require_login
    unless Current.user
      redirect_to welcome_path
    end
  end

  def catch_not_found(e)
    Rails.logger.debug('We had a not found exception')
    flash.alert = e.to_s
    redirect_to welcome_path
  end
end
