class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @question.save
      flash[:notice] = "Your answer has been saved."
      redirect_to question_path([@question.id])
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Your answer has been saved."
      redirect_to question_path([@question.id])
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to questions_path
  end

  private
  def answer_params
    params.require(:answer).permit(:answer_body, :answer_author)
  end
end
