class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find_by id: params[:id]
  end
  
  def create
    @question = Question.new questions_params
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  private

  def questions_params
    params.require(:question).permit(:title, :body)
  end
end
