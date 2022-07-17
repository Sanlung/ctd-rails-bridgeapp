class AnswersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_category, :set_question, :require_login
  before_action :set_answers
  before_action :set_answer, only: %i[edit update destroy]
  before_action :set_user, only: %i[edit create]

  # GET /categories/1/questions/1/answers
  def index; end

  # GET /categories/1/questions/1/answers/new
  def new
    @answer = Answer.new
  end

  # GET /categories/1/questions/1/answers/1/edit
  def edit
    if @user.id != @answer.user_id
      flash.notice = 'You don\'t have permission to edit the answer.'
    end
  end

  # POST /categories/1/questions/1/answers
  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      flash.notice = 'The answer was created successfully.'
      redirect_to @answers
    else
      flash.now.alert = @answer.errors.full_messages.to_sentence
      render :new
    end
  end

  # PATCH/PUT /categories/1/questions/1/answers/1
  def update
    if @answer.update(answer_params)
      @answer.update(answer_params)
      flash.notice = 'The answer was update successfully.'
      redirect_to @answers
    else
      flash.now.alert = @answer.errors.full_messages.to_sentence
      render :edit
    end
  end

  # DELETE /categories/1/questions/1/answers/1
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answerer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_user
    @user = Current.user
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answers
    prim_keys = []
    Answers.find_each do |a|
      prim_keys << a.id if a.question_id == @question.id
    end
    @answers = Answer.find(prim_keys)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:content, :question_id, :user_id)
  end

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
