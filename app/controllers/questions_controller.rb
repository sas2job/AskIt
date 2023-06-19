class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def update
    if @question.update(questions_params)
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

  def create
    @question = Question.new questions_params
    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def questions_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find params[:id]
  end
end
