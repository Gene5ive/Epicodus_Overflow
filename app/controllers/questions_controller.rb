class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:question_score)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(skill_params)
    if @question.save
      flash[:notice] = "Your question has been saved."
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Your question has been saved."
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:question_title, :question_body, :question_author)
  end
end
